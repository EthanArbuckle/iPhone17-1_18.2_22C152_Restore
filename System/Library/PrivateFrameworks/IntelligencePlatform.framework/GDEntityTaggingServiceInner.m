@interface GDEntityTaggingServiceInner
+ (id)tagNameWithGdTag:(int64_t)a3;
+ (int64_t)checkServiceState;
+ (int64_t)gdTagTypeWithName:(id)a3;
- (GDEntityTaggingServiceInner)init;
- (GDEntityTaggingServiceInner)initWithEtConfig:(id)a3 error:(id *)a4;
- (void)entitiesForTagWithGdEntityTagType:(int64_t)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5;
- (void)peopleEntityTagsFor:(NSArray *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5;
- (void)personEntitiesFor:(NSArray *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5;
- (void)personEntityTagsFor:(NSString *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5;
- (void)recordDirectFeedbackWithGradedTrue:(GDPersonEntityTagDirectFeedbackSet *)a3 gradedFalse:(GDPersonEntityTagDirectFeedbackSet *)a4 ignored:(GDPersonEntityTagDirectFeedbackSet *)a5 neverPresented:(GDPersonEntityTagDirectFeedbackSet *)a6 error:(id)a7;
- (void)recordStatefulFeedbackWithFeedback:(GDPersonEntityTaggingStatefulFeedback *)a3 error:(id)a4;
@end

@implementation GDEntityTaggingServiceInner

- (GDEntityTaggingServiceInner)initWithEtConfig:(id)a3 error:(id *)a4
{
  id v5 = a3;
  return (GDEntityTaggingServiceInner *)PersonEntityTaggingService.init(etConfig:)(a3);
}

- (void)personEntityTagsFor:(NSString *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
}

- (void)peopleEntityTagsFor:(NSArray *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
}

- (void)entitiesForTagWithGdEntityTagType:(int64_t)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a4;
  v11 = self;

  sub_1B2AF8F40((uint64_t)&unk_1E9C3DE38, (uint64_t)v9);
}

- (void)personEntitiesFor:(NSArray *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
}

+ (id)tagNameWithGdTag:(int64_t)a3
{
  static PersonEntityTaggingService.tagName(gdTag:)();
  v3 = (void *)sub_1B2E82348();
  swift_bridgeObjectRelease();

  return v3;
}

+ (int64_t)gdTagTypeWithName:(id)a3
{
  uint64_t v3 = sub_1B2E82378();
  int64_t v5 = static PersonEntityTaggingService.gdTagType(name:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (int64_t)checkServiceState
{
  return static PersonEntityTaggingService.checkServiceState()();
}

- (void)recordStatefulFeedbackWithFeedback:(GDPersonEntityTaggingStatefulFeedback *)a3 error:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_1B2AF8F40((uint64_t)&unk_1E9C3DE18, (uint64_t)v7);
}

- (void)recordDirectFeedbackWithGradedTrue:(GDPersonEntityTagDirectFeedbackSet *)a3 gradedFalse:(GDPersonEntityTagDirectFeedbackSet *)a4 ignored:(GDPersonEntityTagDirectFeedbackSet *)a5 neverPresented:(GDPersonEntityTagDirectFeedbackSet *)a6 error:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;

  sub_1B2AF8F40((uint64_t)&unk_1E9C3DDD8, (uint64_t)v13);
}

- (GDEntityTaggingServiceInner)init
{
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GDEntityTaggingServiceInner_feedbackService);
}

@end