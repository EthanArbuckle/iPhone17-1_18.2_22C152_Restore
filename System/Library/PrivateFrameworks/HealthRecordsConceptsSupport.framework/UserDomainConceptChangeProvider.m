@interface UserDomainConceptChangeProvider
- (_TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider)init;
- (void)userDomainConceptStore:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptStore:(id)a3 didDeleteUserDomainConcepts:(id)a4;
- (void)userDomainConceptStore:(id)a3 didUpdateUserDomainConcepts:(id)a4;
@end

@implementation UserDomainConceptChangeProvider

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcStore));
  swift_release();
}

- (void)userDomainConceptStore:(id)a3 didAddUserDomainConcepts:(id)a4
{
}

- (void)userDomainConceptStore:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
}

- (void)userDomainConceptStore:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
}

- (_TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider)init
{
  result = (_TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end