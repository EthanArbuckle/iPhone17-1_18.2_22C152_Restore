@interface FAPickerSelection
+ (id)addSelection;
- (BOOL)isAddSelection;
- (FAFamilyMember)selectedMember;
- (FAPickerSelection)init;
- (FAPickerSelection)initWithSelectedMember:(id)a3;
@end

@implementation FAPickerSelection

- (BOOL)isAddSelection
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___FAPickerSelection_isAddSelection);
}

- (FAFamilyMember)selectedMember
{
  return (FAFamilyMember *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___FAPickerSelection_selectedMember));
}

+ (id)addSelection
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v3 = objc_allocWithZone(ObjCClassMetadata);
  v3[OBJC_IVAR___FAPickerSelection_isAddSelection] = 1;
  *(void *)&v3[OBJC_IVAR___FAPickerSelection_selectedMember] = 0;
  v6.receiver = v3;
  v6.super_class = ObjCClassMetadata;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  return v4;
}

- (FAPickerSelection)initWithSelectedMember:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___FAPickerSelection_isAddSelection) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelection_selectedMember) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(FAPickerSelection *)&v8 init];
}

- (FAPickerSelection)init
{
  result = (FAPickerSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end