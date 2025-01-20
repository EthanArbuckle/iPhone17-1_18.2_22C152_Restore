@interface MPRemoteCommandEvent
+ (MPRemoteCommandEvent)eventWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (MPRemoteCommand)command;
- (MPRemoteCommandEvent)init;
- (MPRemoteCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSDictionary)mediaRemoteOptions;
- (NSString)associatedParticipantIdentifier;
- (NSString)commandID;
- (NSString)contentItemID;
- (NSString)contextID;
- (NSString)interfaceID;
- (NSString)sourceID;
- (NSTimeInterval)timestamp;
- (double)timeout;
- (id)description;
- (int64_t)playbackQueueOffset;
- (unsigned)mediaRemoteCommandType;
@end

@implementation MPRemoteCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_mediaRemoteOptions, 0);
}

- (double)timeout
{
  return self->_timeout;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (MPRemoteCommand)command
{
  return self->_command;
}

- (int64_t)playbackQueueOffset
{
  v2 = [(MPRemoteCommandEvent *)self mediaRemoteOptions];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F776F0]];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (NSString)contentItemID
{
  v2 = [(MPRemoteCommandEvent *)self mediaRemoteOptions];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F77678]];

  return (NSString *)v3;
}

- (NSString)associatedParticipantIdentifier
{
  v2 = [(MPRemoteCommandEvent *)self mediaRemoteOptions];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F77650]];

  return (NSString *)v3;
}

- (NSString)sourceID
{
  v3 = [(MPRemoteCommandEvent *)self mediaRemoteOptions];
  int64_t v4 = [v3 objectForKeyedSubscript:@"kMRMediaRemoteOptionSenderID"];

  v5 = [(MPRemoteCommandEvent *)self mediaRemoteOptions];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F77770]];

  v7 = [NSString stringWithFormat:@"%@ (%@)", v4, v6];

  return (NSString *)v7;
}

- (NSString)interfaceID
{
  v2 = [(MPRemoteCommandEvent *)self mediaRemoteOptions];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F77770]];

  return (NSString *)v3;
}

- (NSString)commandID
{
  return self->_commandID;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSDictionary)mediaRemoteOptions
{
  return self->_mediaRemoteOptions;
}

- (unsigned)mediaRemoteCommandType
{
  v2 = [(MPRemoteCommandEvent *)self command];
  unsigned int v3 = [v2 mediaRemoteCommandType];

  return v3;
}

- (id)description
{
  unsigned int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPRemoteCommandEvent *)self command];
  v6 = [(MPRemoteCommandEvent *)self commandID];
  v7 = [(MPRemoteCommandEvent *)self sourceID];
  v8 = [v3 stringWithFormat:@"<%@: %p command=%@ commandID=%@ sourceID=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (MPRemoteCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MPRemoteCommandEvent;
  v10 = [(MPRemoteCommandEvent *)&v33 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_command, a3);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v11->_timestamp = v12;
    [v8 timeout];
    v11->_timeout = v13;
    uint64_t v14 = *MEMORY[0x1E4F77670];
    v15 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F77670]];

    if (v15)
    {
      v16 = [v9 objectForKeyedSubscript:v14];
      [v16 doubleValue];
      v11->_timeout = v17;
    }
    uint64_t v18 = [v9 copy];
    mediaRemoteOptions = v11->_mediaRemoteOptions;
    v11->_mediaRemoteOptions = (NSDictionary *)v18;

    v20 = [v9 objectForKey:*MEMORY[0x1E4F77680]];
    uint64_t v21 = [v20 copy];
    contextID = v11->_contextID;
    v11->_contextID = (NSString *)v21;

    v23 = [v9 objectForKey:*MEMORY[0x1E4F77660]];
    v24 = (void *)[v23 copy];
    v25 = v24;
    if (v24)
    {
      v26 = v24;
      commandID = v11->_commandID;
      v11->_commandID = v26;
    }
    else
    {
      v28 = NSString;
      commandID = [MEMORY[0x1E4F29128] UUID];
      v29 = [commandID UUIDString];
      uint64_t v30 = [v28 stringWithFormat:@"<missing: %@>", v29];
      v31 = v11->_commandID;
      v11->_commandID = (NSString *)v30;
    }
  }

  return v11;
}

- (MPRemoteCommandEvent)init
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%@s cannot be initialized externally.", v6 format];

  return 0;
}

+ (MPRemoteCommandEvent)eventWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_opt_class();
  switch((int)v5)
  {
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 121:
    case 122:
    case 124:
    case 125:
    case 127:
    case 128:
    case 130:
    case 131:
    case 132:
    case 133:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 142:
LABEL_3:
      id v9 = objc_opt_class();
      break;
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 123:
    case 126:
    case 129:
    case 134:
    case 141:
      break;
    default:
      switch((int)v5)
      {
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
          goto LABEL_3;
        default:
          goto LABEL_4;
      }
  }
LABEL_4:
  v10 = (void *)[objc_alloc((Class)v9) initWithCommand:v8 mediaRemoteType:v5 options:v7];

  return (MPRemoteCommandEvent *)v10;
}

@end