@interface AttendeeDynamicOptionsProvider.AutocompleterDelegate
- (_TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate)init;
- (void)autcompleterUpdated:(id)a3;
@end

@implementation AttendeeDynamicOptionsProvider.AutocompleterDelegate

- (_TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate)init
{
  v3 = (char *)self
     + OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_continuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B56D0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_autocompleter) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AttendeeDynamicOptionsProvider.AutocompleterDelegate();
  return [(AttendeeDynamicOptionsProvider.AutocompleterDelegate *)&v6 init];
}

- (void)autcompleterUpdated:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_228F896F8(v4);
}

- (void).cxx_destruct
{
  sub_228F8A7CC((uint64_t)self+ OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_continuation);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_autocompleter);
}

@end