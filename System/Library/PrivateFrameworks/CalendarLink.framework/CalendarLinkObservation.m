@interface CalendarLinkObservation
+ (BOOL)isObserved;
+ (void)notifyObservers;
- (CalendarLinkObservation)init;
- (void)dealloc;
@end

@implementation CalendarLinkObservation

- (CalendarLinkObservation)init
{
  return (CalendarLinkObservation *)sub_2290383E0();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___CalendarLinkObservation_observationTask))
  {
    v3 = self;
    sub_229040F70();
    __swift_instantiateConcreteTypeFromMangledName(qword_26AF65E40);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B7AE0);
    sub_2290423F0();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CalendarLinkObservation();
  [(CalendarLinkObservation *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

+ (BOOL)isObserved
{
  return sub_22903A418() & 1;
}

+ (void)notifyObservers
{
}

@end