@interface _IMSPIConnectionController
+ (id)sharedController;
- (void)clearChatCap;
- (void)setChatCap;
- (void)setChatSendCap;
- (void)setChatSendCapWithAttachments;
@end

@implementation _IMSPIConnectionController

+ (id)sharedController
{
  if (qword_1EB3F2370 != -1) {
    dispatch_once(&qword_1EB3F2370, &unk_1EF8E5438);
  }
  v2 = (void *)qword_1E965E920;

  return v2;
}

- (void)setChatCap
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v5 = (*MEMORY[0x1E4F6C508] | *MEMORY[0x1E4F6C4F0]) | *MEMORY[0x1E4F6C530];

  sub_1A4BC0518(v5, v2, v3, v4);
}

- (void)setChatSendCap
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v5 = *MEMORY[0x1E4F6C508] | *MEMORY[0x1E4F6C4F0] | (*MEMORY[0x1E4F6C560] | *MEMORY[0x1E4F6C530]);

  sub_1A4BC0518(v5, v2, v3, v4);
}

- (void)setChatSendCapWithAttachments
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v5 = *MEMORY[0x1E4F6C508] | *MEMORY[0x1E4F6C4F0] | (*MEMORY[0x1E4F6C560] | *MEMORY[0x1E4F6C530]) | *MEMORY[0x1E4F6C518];

  sub_1A4BC0518(v5, v2, v3, v4);
}

- (void)clearChatCap
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }

  sub_1A4BC0518(0, v2, v3, v4);
}

@end