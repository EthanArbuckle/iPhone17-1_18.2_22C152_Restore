@interface IDSProtobuf(blt_TransportData)
- (BLTPBTransportData)transportData;
@end

@implementation IDSProtobuf(blt_TransportData)

- (BLTPBTransportData)transportData
{
  v1 = [a1 data];
  unint64_t v2 = [v1 length] - 2;
  id v3 = v1;
  uint64_t v4 = [v3 bytes];
  unint64_t v5 = *(unsigned __int16 *)(v4 + v2);
  if (*(_WORD *)(v4 + v2)) {
    BOOL v6 = v2 >= v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v8 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v3, "bytes") + v2 - v5, v5, 0);
    v7 = [[BLTPBTransportData alloc] initWithData:v8];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end