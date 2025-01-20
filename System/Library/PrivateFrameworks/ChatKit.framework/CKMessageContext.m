@interface CKMessageContext
+ selfContext;
- (BOOL)isAudioMessage;
- (BOOL)isFromMe;
- (BOOL)isSenderUnauthenticated;
- (BOOL)isSenderUnknown;
- (BOOL)isSpam;
- (IMChatContext)chatContext;
- (NSString)serviceName;
- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation CKMessageContext

+ selfContext
{
  unsigned char *v2;
  uint64_t vars8;

  v2 = objc_alloc_init((Class)a1);
  v2[24] = 1;
  *((_WORD *)v2 + 13) = 0;
  v2[28] = 0;

  return v2;
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CKMessageContext.m", 46, @"Invalid parameter not satisfying: %@", @"[cls isSubclassOfClass:[CKMessageContext class]]" object file lineNumber description];
  }
  v8 = [[(objc_class *)a3 allocWithZone:a4] init];
  v9 = [(CKMessageContext *)self chatContext];
  uint64_t v10 = [v9 copyWithZone:a4];
  v11 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v10;

  v12 = [(CKMessageContext *)self serviceName];
  uint64_t v13 = [v12 copyWithZone:a4];
  v14 = (void *)*((void *)v8 + 2);
  *((void *)v8 + 2) = v13;

  *((unsigned char *)v8 + 24) = [(CKMessageContext *)self isFromMe];
  *((unsigned char *)v8 + 25) = [(CKMessageContext *)self isSpam];
  *((unsigned char *)v8 + 26) = [(CKMessageContext *)self isSenderUnknown];
  *((unsigned char *)v8 + 27) = [(CKMessageContext *)self isSenderUnauthenticated];
  *((unsigned char *)v8 + 28) = [(CKMessageContext *)self isAudioMessage];
  return v8;
}

- (id)description
{
  uint64_t v13 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [(CKMessageContext *)self chatContext];
  v5 = [(CKMessageContext *)self serviceName];
  if ([(CKMessageContext *)self isFromMe]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if ([(CKMessageContext *)self isSpam]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(CKMessageContext *)self isSenderUnknown]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(CKMessageContext *)self isSenderUnauthenticated]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(CKMessageContext *)self isAudioMessage]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  v11 = [v13 stringWithFormat:@"<%@, chatContext: %@, serviceName: %@, fromMe: %@, spam: %@, senderUnknown: %@, senderUnauthenticated: %@, audioMessage: %@>", v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(CKMessageContext *)self _copyWithClass:v5 zone:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(CKMessageContext *)self _copyWithClass:v5 zone:a3];
}

- (IMChatContext)chatContext
{
  return self->_chatContext;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (BOOL)isSpam
{
  return self->_spam;
}

- (BOOL)isSenderUnknown
{
  return self->_senderUnknown;
}

- (BOOL)isSenderUnauthenticated
{
  return self->_senderUnauthenticated;
}

- (BOOL)isAudioMessage
{
  return self->_audioMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_chatContext, 0);
}

@end