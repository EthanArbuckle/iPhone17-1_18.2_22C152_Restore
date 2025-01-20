@interface CKInboxCellData
+ (CKInboxCellData)allMessagesCellData;
+ (CKInboxCellData)blackholeJunkCellData;
+ (CKInboxCellData)junkCellData;
+ (CKInboxCellData)knownSendersCellData;
+ (CKInboxCellData)oscarCellData;
+ (CKInboxCellData)promotionalCellData;
+ (CKInboxCellData)recentlyDeletedCellData;
+ (CKInboxCellData)transactionalCellData;
+ (CKInboxCellData)unknownSendersCellData;
+ (CKInboxCellData)unreadMessagesCellData;
- (CKInboxCellData)init;
- (CKInboxCellData)initWithImage:(id)a3 title:(id)a4 filterMode:(unint64_t)a5;
- (NSString)title;
- (UIImage)image;
- (unint64_t)filterMode;
@end

@implementation CKInboxCellData

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___CKInboxCellData_image));
}

- (NSString)title
{
  sub_18F7B6CA0();
  v2 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (unint64_t)filterMode
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKInboxCellData_filterMode);
}

- (CKInboxCellData)initWithImage:(id)a3 title:(id)a4 filterMode:(unint64_t)a5
{
  uint64_t v8 = sub_18F7B97E0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKInboxCellData_image) = (Class)a3;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___CKInboxCellData_title);
  uint64_t *v9 = v8;
  v9[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKInboxCellData_filterMode) = (Class)a5;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for InboxCellData();
  id v11 = a3;
  return [(CKInboxCellData *)&v13 init];
}

- (CKInboxCellData)init
{
  result = (CKInboxCellData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

+ (CKInboxCellData)allMessagesCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379A0, (void **)&qword_1E923E5C0);
}

+ (CKInboxCellData)knownSendersCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379A8, (void **)&qword_1E923E5C8);
}

+ (CKInboxCellData)unknownSendersCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379B0, (void **)&qword_1E923E5D0);
}

+ (CKInboxCellData)unreadMessagesCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379B8, (void **)&qword_1E923E5D8);
}

+ (CKInboxCellData)oscarCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379C0, (void **)&qword_1E923E5E0);
}

+ (CKInboxCellData)recentlyDeletedCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379C8, (void **)&qword_1E923E5E8);
}

+ (CKInboxCellData)transactionalCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379D0, (void **)&qword_1E923E5F0);
}

+ (CKInboxCellData)promotionalCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379D8, (void **)&qword_1E923E5F8);
}

+ (CKInboxCellData)junkCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379E0, (void **)&qword_1E923E600);
}

+ (CKInboxCellData)blackholeJunkCellData
{
  return (CKInboxCellData *)sub_18F679CA4((uint64_t)a1, (uint64_t)a2, &qword_1E92379E8, (void **)&qword_1E923E608);
}

@end