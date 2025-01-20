@interface BlastDoorBreadcrumbTextMarkerAttribute
- (BlastDoorBreadcrumbTextMarkerAttribute)init;
- (NSString)breadcrumbText;
- (NSString)description;
- (_NSRange)range;
@end

@implementation BlastDoorBreadcrumbTextMarkerAttribute

- (NSString)description
{
  return (NSString *)sub_1B1776590();
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBreadcrumbTextMarkerAttribute_breadcrumbTextMarkerAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)breadcrumbText
{
  return (NSString *)sub_1B17A7844();
}

- (BlastDoorBreadcrumbTextMarkerAttribute)init
{
  _NSRange result = (BlastDoorBreadcrumbTextMarkerAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end