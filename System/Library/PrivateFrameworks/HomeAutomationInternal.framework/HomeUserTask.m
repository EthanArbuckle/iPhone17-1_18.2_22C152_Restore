@interface HomeUserTask
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HomeUserTask)initWithCoder:(id)a3;
- (HomeUserTask)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation HomeUserTask

- (BOOL)isEqual:(id)a3
{
  return sub_22E329BAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))HomeUserTask.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_22E4EDE28(self, (uint64_t)a2, (void (*)(void))HomeUserTask.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HomeUserTask)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
  {
    uint64_t v6 = sub_22E6D0140();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_22E6D0140();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_22E6D0140();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  return (HomeUserTask *)HomeUserTask.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (HomeUserTask)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeUserTask();
  return [(HomeUserTask *)&v5 initWithCoder:a3];
}

@end