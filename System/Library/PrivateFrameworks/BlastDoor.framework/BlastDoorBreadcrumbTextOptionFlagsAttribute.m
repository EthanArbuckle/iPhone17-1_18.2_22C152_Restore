@interface BlastDoorBreadcrumbTextOptionFlagsAttribute
- (BlastDoorBreadcrumbTextOptionFlagsAttribute)init;
- (NSString)description;
- (_NSRange)range;
- (unint64_t)optionFlags;
@end

@implementation BlastDoorBreadcrumbTextOptionFlagsAttribute

- (NSString)description
{
  return (NSString *)sub_1B1776230();
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBreadcrumbTextOptionFlagsAttribute_breadcrumbTextOptionFlagsAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)optionFlags
{
  return *(void *)&self->breadcrumbTextOptionFlagsAttribute[OBJC_IVAR___BlastDoorBreadcrumbTextOptionFlagsAttribute_breadcrumbTextOptionFlagsAttribute
                                                            + 8];
}

- (BlastDoorBreadcrumbTextOptionFlagsAttribute)init
{
  _NSRange result = (BlastDoorBreadcrumbTextOptionFlagsAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end