@interface CTCall
+ (id)callForCTCallRef:(__CTCall *)a3;
+ (id)callForCXCall:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)callID;
- (NSString)callState;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCallID:(id)a3;
- (void)setCallState:(id)a3;
@end

@implementation CTCall

+ (id)callForCTCallRef:(__CTCall *)a3
{
  if (!a3) {
    return 0;
  }
  v4 = objc_alloc_init(CTCall);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  switch(CTCallGetStatus((uint64_t)a3))
  {
    case 1u:
    case 2u:
      v6 = @"CTCallStateConnected";
      goto LABEL_10;
    case 3u:
      v6 = @"CTCallStateDialing";
      goto LABEL_10;
    case 4u:
      v6 = @"CTCallStateIncoming";
      goto LABEL_10;
    case 5u:
      v6 = @"CTCallStateDisconnected";
LABEL_10:
      [(CTCall *)v5 setCallState:v6];
      break;
    default:

      v5 = 0;
      break;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v9 = CTCallCopyUUID((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)a3);
  if (v9)
  {
    CFUUIDRef v10 = v9;
    CFStringRef v11 = CFUUIDCreateString(v8, v9);
    if (v11)
    {
      v12 = (__CFString *)v11;
      [(CTCall *)v5 setCallID:v11];
    }
    CFRelease(v10);
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

+ (id)callForCXCall:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = objc_alloc_init(CTCall);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  if ([a3 isOutgoing]) {
    v6 = @"CTCallStateDialing";
  }
  else {
    v6 = @"CTCallStateIncoming";
  }
  [(CTCall *)v5 setCallState:v6];
  if ([a3 hasConnected]) {
    [(CTCall *)v5 setCallState:@"CTCallStateConnected"];
  }
  if ([a3 hasEnded]) {
    [(CTCall *)v5 setCallState:@"CTCallStateDisconnected"];
  }
  -[CTCall setCallID:](v5, "setCallID:", objc_msgSend((id)objc_msgSend(a3, "UUID"), "UUIDString"));

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CTCall;
  [(CTCall *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CTCall (%p) {\n\tcallState: [%@]\n\tCall ID: [%@]\n}\n", self, -[CTCall callState](self, "callState"), -[CTCall callID](self, "callID")];
}

- (BOOL)isEqual:(id)a3
{
  if (!-[CTCall callID](self, "callID") || ![a3 callID]) {
    return 0;
  }
  v5 = [(CTCall *)self callID];
  uint64_t v6 = [a3 callID];

  return [(NSString *)v5 isEqualToString:v6];
}

- (unint64_t)hash
{
  return [(NSString *)self->_callID hash];
}

- (NSString)callState
{
  return self->_callState;
}

- (void)setCallState:(id)a3
{
}

- (NSString)callID
{
  return self->_callID;
}

- (void)setCallID:(id)a3
{
}

@end