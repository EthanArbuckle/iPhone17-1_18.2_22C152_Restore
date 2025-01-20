@interface GKVoiceChatDictionary
+ (BOOL)validateCancel:(id)a3;
+ (BOOL)validateDictionary:(id)a3;
+ (BOOL)validateFocus:(id)a3;
+ (BOOL)validateInvite:(id)a3;
+ (BOOL)validateReply:(id)a3;
+ (id)dictionaryFromData:(id)a3;
+ (id)inviteDictionaryToParticipantID:(id)a3 fromParticipantID:(id)a4 connectionData:(id)a5 callID:(unsigned int)a6 focus:(BOOL)a7;
- (BOOL)isCancelDictionary;
- (BOOL)isFocus;
- (BOOL)isFocusDictionary;
- (BOOL)isInviteDictionary;
- (BOOL)isReplyDictionary;
- (BOOL)matchesNonce:(int64_t)a3;
- (BOOL)matchesResponse:(id)a3;
- (GKVoiceChatDictionary)initWithCoder:(id)a3;
- (id)cancelDictionary;
- (id)connectionData;
- (id)createBlob;
- (id)description;
- (id)focusDictionary:(BOOL)a3;
- (id)fromParticipantID;
- (id)localVCPartyID;
- (id)participantID;
- (id)remoteVCPartyID;
- (id)replyDictionary:(unint64_t)a3 connectionData:(id)a4 callID:(unsigned int)a5 focus:(BOOL)a6;
- (id)setLocalVCPartyID:(id)a3;
- (id)setRemoteVCPartyID:(id)a3;
- (id)version;
- (int64_t)nonce;
- (unint64_t)response;
- (unint64_t)type;
- (unsigned)callID;
- (unsigned)originalCallID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCallID:(unsigned int)a3;
- (void)setFocus:(BOOL)a3;
- (void)setFromParticipantID:(id)a3;
- (void)setNonce:(int64_t)a3;
@end

@implementation GKVoiceChatDictionary

+ (id)inviteDictionaryToParticipantID:(id)a3 fromParticipantID:(id)a4 connectionData:(id)a5 callID:(unsigned int)a6 focus:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  v12 = objc_alloc_init(GKVoiceChatDictionary);
  v12->type = 256;
  v13 = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:9];
  v12->actualDictionary = v13;
  [(NSMutableDictionary *)v13 setObject:@"Invite" forKeyedSubscript:@"action"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v8], @"callID");
  [(NSMutableDictionary *)v13 setObject:a5 forKeyedSubscript:@"connectionData"];
  [(NSMutableDictionary *)v13 setObject:a3 forKeyedSubscript:@"participantID"];
  [(NSMutableDictionary *)v13 setObject:a4 forKeyedSubscript:@"fromParticipantID"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v7], @"isFocus");
  [(NSMutableDictionary *)v13 setObject:@"2.0" forKeyedSubscript:@"version"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", [NSString stringWithFormat:@"%@", objc_msgSend(NSNumber, "numberWithLong:", random())], @"nonce");
  v12->orignalCallID = -1;
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatDictionary;
  [(GKVoiceChatDictionary *)&v3 dealloc];
}

- (void)setCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->orignalCallID == -1) {
    self->orignalCallID = [(GKVoiceChatDictionary *)self callID];
  }
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  actualDictionary = self->actualDictionary;
  [(NSMutableDictionary *)actualDictionary setObject:v5 forKeyedSubscript:@"callID"];
}

- (unsigned)originalCallID
{
  if (self->orignalCallID == -1) {
    return [(GKVoiceChatDictionary *)self callID];
  }
  else {
    return self->orignalCallID;
  }
}

+ (id)dictionaryFromData:(id)a3
{
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"GKVoiceChatDictionary", @"NSMutableDictionary", @"NSDictionary", @"NSObject", @"NSString", @"NSData", @"NSNumber", @"NSValue", 0);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C48]) initForReadingWithData:a3];
  [v6 _setAllowedClasses:v5];
  id v7 = (id)[v6 decodeObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a1 validateDictionary:v7]) {
    return v7;
  }

  return 0;
}

+ (BOOL)validateDictionary:(id)a3
{
  switch(*((void *)a3 + 2))
  {
    case 0x100:
      BOOL result = objc_msgSend(a1, "validateInvite:");
      break;
    case 0x101:
      BOOL result = objc_msgSend(a1, "validateReply:");
      break;
    case 0x102:
      BOOL result = objc_msgSend(a1, "validateCancel:");
      break;
    case 0x103:
      BOOL result = objc_msgSend(a1, "validateFocus:");
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

+ (BOOL)validateInvite:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([a3 type] == 256)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [&unk_26D3A4188 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_26D3A4188);
        }
        uint64_t v8 = [*((id *)a3 + 1) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (!v8) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [&unk_26D3A4188 countByEnumeratingWithState:&v10 objects:v14 count:16];
          LOBYTE(v8) = 1;
          if (v5) {
            goto LABEL_4;
          }
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (BOOL)validateReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([a3 type] == 257)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [&unk_26D3A41A0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_26D3A41A0);
        }
        uint64_t v8 = [*((id *)a3 + 1) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (!v8) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [&unk_26D3A41A0 countByEnumeratingWithState:&v10 objects:v14 count:16];
          LOBYTE(v8) = 1;
          if (v5) {
            goto LABEL_4;
          }
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (BOOL)validateCancel:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([a3 type] == 258)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [&unk_26D3A41B8 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_26D3A41B8);
        }
        uint64_t v8 = [*((id *)a3 + 1) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (!v8) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [&unk_26D3A41B8 countByEnumeratingWithState:&v10 objects:v14 count:16];
          LOBYTE(v8) = 1;
          if (v5) {
            goto LABEL_4;
          }
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (BOOL)validateFocus:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([a3 type] == 259)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [&unk_26D3A41D0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_26D3A41D0);
        }
        uint64_t v8 = [*((id *)a3 + 1) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (!v8) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [&unk_26D3A41D0 countByEnumeratingWithState:&v10 objects:v14 count:16];
          LOBYTE(v8) = 1;
          if (v5) {
            goto LABEL_4;
          }
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)replyDictionary:(unint64_t)a3 connectionData:(id)a4 callID:(unsigned int)a5 focus:(BOOL)a6
{
  if (self->type != 256) {
    return 0;
  }
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  long long v11 = objc_alloc_init(GKVoiceChatDictionary);
  long long v12 = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:9];
  v11->actualDictionary = v12;
  [(NSMutableDictionary *)v12 setObject:@"Reply" forKeyedSubscript:@"action"];
  v11->type = 257;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7], @"callID");
  [(NSMutableDictionary *)v12 setObject:a4 forKeyedSubscript:@"connectionData"];
  [(NSMutableDictionary *)v12 setObject:[(GKVoiceChatDictionary *)self fromParticipantID] forKeyedSubscript:@"participantID"];
  [(NSMutableDictionary *)v12 setObject:[(GKVoiceChatDictionary *)self participantID] forKeyedSubscript:@"fromParticipantID"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v6], @"isFocus");
  [(NSMutableDictionary *)v12 setObject:@"2.0" forKeyedSubscript:@"version"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", -[GKVoiceChatDictionary nonce](self, "nonce")), @"nonce");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInteger:a3], @"replyCode");
  if ([(GKVoiceChatDictionary *)self remoteVCPartyID]) {
    [(NSMutableDictionary *)v12 setObject:[(GKVoiceChatDictionary *)self remoteVCPartyID] forKeyedSubscript:@"localVCPartyID"];
  }
  if ([(GKVoiceChatDictionary *)self localVCPartyID]) {
    [(NSMutableDictionary *)v12 setObject:[(GKVoiceChatDictionary *)self localVCPartyID] forKeyedSubscript:@"remoteVCPartyID"];
  }
  v11->orignalCallID = -1;
  return v11;
}

- (id)cancelDictionary
{
  uint64_t v3 = objc_alloc_init(GKVoiceChatDictionary);
  uint64_t v4 = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->actualDictionary];
  v3->actualDictionary = v4;
  v3->type = 258;
  [(NSMutableDictionary *)v4 removeObjectForKey:@"connectionData"];
  [(NSMutableDictionary *)v4 setObject:@"Cancel" forKeyedSubscript:@"action"];
  v3->orignalCallID = -1;
  return v3;
}

- (id)focusDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_alloc_init(GKVoiceChatDictionary);
  BOOL v6 = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->actualDictionary];
  v5->actualDictionary = v6;
  v5->type = 259;
  [(NSMutableDictionary *)v6 removeObjectForKey:@"connectionData"];
  [(NSMutableDictionary *)v6 setObject:@"Focus" forKeyedSubscript:@"action"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v3], @"isFocus");
  v5->orignalCallID = -1;
  return v5;
}

- (BOOL)isInviteDictionary
{
  return self->type == 256;
}

- (BOOL)isCancelDictionary
{
  return self->type == 258;
}

- (BOOL)isReplyDictionary
{
  return self->type == 257;
}

- (BOOL)isFocusDictionary
{
  return self->type == 259;
}

- (BOOL)matchesResponse:(id)a3
{
  if (self->type != 256
    || !-[GKVoiceChatDictionary matchesNonce:](self, "matchesNonce:", [a3 nonce])
    || [a3 type] != 257)
  {
    return 0;
  }
  id v5 = [(GKVoiceChatDictionary *)self participantID];
  uint64_t v6 = [a3 fromParticipantID];
  return [v5 isEqualToString:v6];
}

- (unint64_t)type
{
  return self->type;
}

- (unint64_t)response
{
  if (self->type != 257) {
    return 0;
  }
  v2 = (void *)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"replyCode"];
  return [v2 integerValue];
}

- (id)connectionData
{
  return (id)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"connectionData"];
}

- (id)fromParticipantID
{
  return (id)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"fromParticipantID"];
}

- (void)setFromParticipantID:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->actualDictionary setObject:a3 forKeyedSubscript:@"fromParticipantID"];
  }
}

- (id)participantID
{
  return (id)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"participantID"];
}

- (int64_t)nonce
{
  v2 = (void *)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"nonce"];
  return [v2 integerValue];
}

- (void)setNonce:(int64_t)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  actualDictionary = self->actualDictionary;
  [(NSMutableDictionary *)actualDictionary setObject:v4 forKeyedSubscript:@"nonce"];
}

- (BOOL)matchesNonce:(int64_t)a3
{
  return [(GKVoiceChatDictionary *)self nonce] == a3;
}

- (BOOL)isFocus
{
  v2 = (void *)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"isFocus"];
  return [v2 BOOLValue];
}

- (void)setFocus:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  actualDictionary = self->actualDictionary;
  [(NSMutableDictionary *)actualDictionary setObject:v4 forKeyedSubscript:@"isFocus"];
}

- (id)version
{
  return (id)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"version"];
}

- (id)createBlob
{
  return (id)[MEMORY[0x263F08688] archivedDataWithRootObject:self];
}

- (unsigned)callID
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", @"callID"), "integerValue");
}

- (id)localVCPartyID
{
  return (id)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"localVCPartyID"];
}

- (id)remoteVCPartyID
{
  return (id)[(NSMutableDictionary *)self->actualDictionary objectForKeyedSubscript:@"remoteVCPartyID"];
}

- (id)setLocalVCPartyID:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  [(NSMutableDictionary *)self->actualDictionary setObject:v4 forKeyedSubscript:@"localVCPartyID"];

  return 0;
}

- (id)setRemoteVCPartyID:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  [(NSMutableDictionary *)self->actualDictionary setObject:v4 forKeyedSubscript:@"remoteVCPartyID"];

  return 0;
}

- (GKVoiceChatDictionary)initWithCoder:(id)a3
{
  self->actualDictionary = (NSMutableDictionary *)(id)[a3 decodeObject];
  self->orignalCallID = -1;
  unsigned int v6 = 0;
  [a3 decodeValueOfObjCType:"I" at:&v6 size:4];
  self->type = v6;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->actualDictionary];
  [a3 encodeValueOfObjCType:"I" at:&self->type];
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->actualDictionary description];
}

+ (void)dictionaryFromData:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = "+[GKVoiceChatDictionary dictionaryFromData:]";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 78;
  *((_WORD *)buf + 14) = 2080;
  *(void *)(buf + 30) = a1;
  _os_log_error_impl(&dword_221563000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKVoiceChatDictionary corrupted %s", buf, 0x26u);
}

@end