@interface FMR1HapticPattern
- (_TtC11FMFindingUI17FMR1HapticPattern)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (_TtC11FMFindingUI17FMR1HapticPattern)initWithDictionary:(id)a3 error:(id *)a4;
- (_TtC11FMFindingUI17FMR1HapticPattern)initWithEvents:(id)a3 parameterCurves:(id)a4 error:(id *)a5;
- (_TtC11FMFindingUI17FMR1HapticPattern)initWithEvents:(id)a3 parameters:(id)a4 error:(id *)a5;
@end

@implementation FMR1HapticPattern

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithEvents:(id)a3 parameters:(id)a4 error:(id *)a5
{
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_24D2FA138((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, &qword_269861858, 0x263F00580, (SEL *)&selRef_initWithEvents_parameters_error_);
}

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithEvents:(id)a3 parameterCurves:(id)a4 error:(id *)a5
{
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_24D2FA138((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (unint64_t *)&unk_2698618A0, 0x263F005A0, (SEL *)&selRef_initWithEvents_parameterCurves_error_);
}

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithDictionary:(id)a3 error:(id *)a4
{
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_24D2FA230();
}

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_24D39C780();
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D39C760();
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_24D2FA5B0((uint64_t)v6);
}

- (void).cxx_destruct
{
}

@end