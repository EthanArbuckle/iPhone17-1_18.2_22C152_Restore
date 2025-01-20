@interface PDFAsyncConfigurationViewController.PDFGeneratedResult
- (Class)classForPage;
- (_TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult)init;
@end

@implementation PDFAsyncConfigurationViewController.PDFGeneratedResult

- (Class)classForPage
{
  void (*v6)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult *v7;
  uint64_t v9;
  uint64_t vars8;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_configuration);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v6(&v9, v4, v5);
  if (v9)
  {
    if (v9 == 1)
    {

      type metadata accessor for PDFPageNumberedPage();
    }
    else
    {
    }
  }
  else
  {

    sub_1AD2147D4(0, &qword_1E9A2FBA0);
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult)init
{
  result = (_TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_configuration);
  sub_1AD208DFC(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_pdfData), *(void *)&self->configuration[OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_pdfData]);
  swift_bridgeObjectRelease();
}

@end