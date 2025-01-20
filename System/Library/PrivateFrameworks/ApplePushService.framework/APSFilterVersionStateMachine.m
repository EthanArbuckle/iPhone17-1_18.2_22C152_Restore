@interface APSFilterVersionStateMachine
- (APSFilterVersionStateMachine)init;
- (APSFilterVersionStateMachine)initWithInitialVersion:(unint64_t)a3;
- (BOOL)everHadAckOn:(id)a3;
- (BOOL)everSentFilterOn:(id)a3;
- (BOOL)hasStaleStateOn:(id)a3 comparedTo:(id)a4;
- (BOOL)hasUnAckedVersionOn:(id)a3;
- (BOOL)isOutOfDateOn:(id)a3;
- (id)aps_prettyDescription;
- (id)noteInvalidWithVersion:(unint64_t)a3;
- (unint64_t)versionToSendFor:(id)a3 error:(id *)a4;
- (void)clearInfoFor:(id)a3;
- (void)noteAckedWithVersion:(unint64_t)a3 on:(id)a4;
- (void)noteSentWithVersion:(unint64_t)a3 on:(id)a4;
@end

@implementation APSFilterVersionStateMachine

- (APSFilterVersionStateMachine)initWithInitialVersion:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterVersionStateMachine__highestSentVersion) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterVersionStateMachine__highestAckedVersion) = (Class)a3;
  v3 = self;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR___APSFilterVersionStateMachine__stateByInterface) = (Class)sub_1000BC5C8((uint64_t)&_swiftEmptyArrayStorage);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for FilterVersionStateMachine();
  return [(APSFilterVersionStateMachine *)&v5 init];
}

- (APSFilterVersionStateMachine)init
{
  return [(APSFilterVersionStateMachine *)self initWithInitialVersion:0];
}

- (id)aps_prettyDescription
{
  v2 = self;
  sub_1000BC7BC();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (void).cxx_destruct
{
}

- (unint64_t)versionToSendFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  unint64_t v8 = sub_1000BCAB0(v6, a4);

  return v8;
}

- (void)noteSentWithVersion:(unint64_t)a3 on:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_1000BCDA0(a3, v6);
}

- (void)noteAckedWithVersion:(unint64_t)a3 on:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_1000BCF54(a3, v6);
}

- (id)noteInvalidWithVersion:(unint64_t)a3
{
  v4 = self;
  id v5 = sub_1000BD0F4(a3);

  return v5;
}

- (BOOL)isOutOfDateOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000BD23C(v4);

  return self & 1;
}

- (BOOL)everHadAckOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000BD34C(v4);

  return self & 1;
}

- (BOOL)everSentFilterOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000BD444(v4);

  return self & 1;
}

- (BOOL)hasUnAckedVersionOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000BD53C(v4);

  return self & 1;
}

- (BOOL)hasStaleStateOn:(id)a3 comparedTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  BOOL v9 = sub_1000BD63C(v6, v7);

  return v9;
}

- (void)clearInfoFor:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  id v6 = self;
  sub_1000BDA4C((uint64_t)v5);
  swift_endAccess();
}

@end