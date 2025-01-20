@interface __IMDBackwardCompatibilityMessageIdentifier
- (BOOL)isIgnorableBackwardCompatibilityMessage:(id)a3 inChat:(id)a4;
- (__IMDBackwardCompatibilityMessageIdentifier)init;
@end

@implementation __IMDBackwardCompatibilityMessageIdentifier

- (__IMDBackwardCompatibilityMessageIdentifier)init
{
  uint64_t v3 = OBJC_IVAR_____IMDBackwardCompatibilityMessageIdentifier_parser;
  sub_1D96867CC(&qword_1EBE2B200);
  v4 = (objc_class *)swift_allocObject();
  *((void *)v4 + 2) = MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + v3) = v4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BackwardCompatibilityMessageIdentifier();
  v5 = [(__IMDBackwardCompatibilityMessageIdentifier *)&v7 init];
  sub_1D9881900();

  return v5;
}

- (BOOL)isIgnorableBackwardCompatibilityMessage:(id)a3 inChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1D9880308(v6, v7);
  char v10 = v9;

  return v10 & 1;
}

- (void).cxx_destruct
{
}

@end