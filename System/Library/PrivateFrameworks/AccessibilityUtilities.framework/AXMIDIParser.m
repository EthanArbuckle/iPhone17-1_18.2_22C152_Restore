@interface AXMIDIParser
- (id)parse:(const MIDIPacketList *)a3 error:(id *)a4;
- (int64_t)_eventTypeForStatusByte:(unsigned __int8)a3;
- (unint64_t)_expectedPacketLengthForEventType:(int64_t)a3;
- (unsigned)_channelForStatusByte:(unsigned __int8)a3;
@end

@implementation AXMIDIParser

- (id)parse:(const MIDIPacketList *)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v7 = objc_alloc_init(AXMIDIEvent);
  if (a3->numPackets == 1)
  {
    if (!a3->packet[0].length)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      v9 = AXMIDIErrorDomain;
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v10 = (void *)[[NSString alloc] initWithFormat:@"Received 0-length packet"];
      v30 = v10;
      v11 = (void *)MEMORY[0x1E4F1C9E8];
      v12 = &v30;
      v13 = &v29;
      goto LABEL_9;
    }
    uint64_t v14 = a3->packet[0].data[0];
    [(AXMIDIEvent *)v7 setChannel:[(AXMIDIParser *)self _channelForStatusByte:v14]];
    [(AXMIDIEvent *)v7 setType:[(AXMIDIParser *)self _eventTypeForStatusByte:v14]];
    unint64_t v15 = [(AXMIDIParser *)self _expectedPacketLengthForEventType:[(AXMIDIEvent *)v7 type]];
    if (v15 != a3->packet[0].length)
    {
      unint64_t v20 = v15;
      v21 = (void *)MEMORY[0x1E4F28C58];
      v22 = AXMIDIErrorDomain;
      uint64_t v27 = *MEMORY[0x1E4F28568];
      id v23 = [NSString alloc];
      v10 = [NSNumber numberWithUnsignedLong:v20];
      v17 = [NSNumber numberWithUnsignedShort:a3->packet[0].length];
      v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXMIDIEvent type](v7, "type"));
      v25 = (void *)[v23 initWithFormat:@"Expected packet to be %@ bytes, was actually %@ bytes. type: %@", v10, v17, v24, v27];
      v28 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v18 = [v21 errorWithDomain:v22 code:7 userInfo:v26];

LABEL_10:
      if (v18)
      {

        v7 = 0;
      }
      if (a4) {
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    switch([(AXMIDIEvent *)v7 type])
    {
      case 1:
      case 2:
      case 3:
        [(AXMIDIEvent *)v7 setNote:a3->packet[0].data[1]];
        uint64_t v16 = a3->packet[0].data[2];
        goto LABEL_21;
      case 4:
        [(AXMIDIEvent *)v7 setControl:a3->packet[0].data[1]];
        [(AXMIDIEvent *)v7 setControlValue:a3->packet[0].data[2]];
        break;
      case 5:
        [(AXMIDIEvent *)v7 setProgram:a3->packet[0].data[1]];
        break;
      case 6:
        uint64_t v16 = a3->packet[0].data[1];
LABEL_21:
        [(AXMIDIEvent *)v7 setPressure:v16];
        break;
      case 7:
        [(AXMIDIEvent *)v7 setPitchBend:a3->packet[0].data[1] | (a3->packet[0].data[2] << 7)];
        break;
      default:
        break;
    }
  }
  else if (!a3->numPackets)
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    v9 = AXMIDIErrorDomain;
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v10 = (void *)[[NSString alloc] initWithFormat:@"Received 0 packets"];
    v32[0] = v10;
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    v12 = (void **)v32;
    v13 = &v31;
LABEL_9:
    v17 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
    v18 = [v8 errorWithDomain:v9 code:7 userInfo:v17];
    goto LABEL_10;
  }
  v18 = 0;
  if (a4) {
LABEL_13:
  }
    *a4 = v18;
LABEL_14:

  return v7;
}

- (int64_t)_eventTypeForStatusByte:(unsigned __int8)a3
{
  unsigned int v3 = (a3 >> 4) ^ 8;
  if (v3 < 7 && ((0x7Bu >> v3) & 1) != 0) {
    return qword_18D430920[v3];
  }
  else {
    return 8 * (a3 > 0xEFu);
  }
}

- (unint64_t)_expectedPacketLengthForEventType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 0;
  }
  else {
    return qword_18D430958[a3 - 1];
  }
}

- (unsigned)_channelForStatusByte:(unsigned __int8)a3
{
  if ((a3 & 0xF) == 0xF) {
    return 0x8000;
  }
  else {
    return word_18D430998[a3 & 0xF];
  }
}

@end