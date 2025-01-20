@interface NFCCardSessionDelegate
- (_TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate)init;
- (void)didConnectToReader;
- (void)didDetectField:(BOOL)a3;
- (void)didDisconnectFromReader;
- (void)didInvalidate;
- (void)didReceiveAPDU:(id)a3;
- (void)didStartSession:(id)a3;
- (void)didTerminate:(id)a3;
- (void)fieldChanged:(BOOL)a3;
- (void)hwStateDidChange:(unsigned int)a3;
@end

@implementation NFCCardSessionDelegate

- (void)fieldChanged:(BOOL)a3
{
  v4 = self;
  sub_2214EDA4C(a3);
}

- (void)didReceiveAPDU:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  uint64_t v11 = sub_2214FE890();
  unint64_t v13 = v12;

  v14[1] = v11;
  v14[2] = v13 | 0x1000000000000000;
  char v15 = 0;
  sub_2214E5490(v11, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  sub_2214FEA00();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_2214E5534(v11, v13);
}

- (void)didConnectToReader
{
  v2 = self;
  sub_2214EDC14();
}

- (void)didDisconnectFromReader
{
  v2 = self;
  sub_2214EDECC();
}

- (void)didDetectField:(BOOL)a3
{
  v4 = self;
  sub_2214EE18C(a3);
}

- (void)didStartSession:(id)a3
{
  uint64_t v5 = self;
  id v4 = a3;
  sub_2214EE4C8(a3);
}

- (void)didInvalidate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = xmmword_221501500;
  char v9 = 0;
  uint64_t v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  sub_2214FEA00();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_2214FEA10();
}

- (void)didTerminate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2214EE850(v4);
}

- (void)hwStateDidChange:(unsigned int)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B88);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  long long v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 != 2)
  {
    long long v10 = xmmword_221501500;
    char v11 = 0;
    char v9 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
    sub_2214FEA00();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_2214FEA10();
  }
}

- (_TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate)init
{
  result = (_TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_eventStreamContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52B80);
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end