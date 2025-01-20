@interface WKTextExtractionEditable
- (BOOL)isFocused;
- (BOOL)isSecure;
- (NSString)label;
- (NSString)placeholder;
- (WKTextExtractionEditable)init;
- (WKTextExtractionEditable)initWithLabel:(id)a3 placeholder:(id)a4 isSecure:(BOOL)a5 isFocused:(BOOL)a6;
@end

@implementation WKTextExtractionEditable

- (NSString)label
{
  return (NSString *)sub_24642392C();
}

- (NSString)placeholder
{
  return (NSString *)sub_24642392C();
}

- (BOOL)isSecure
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isSecure);
}

- (BOOL)isFocused
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isFocused);
}

- (WKTextExtractionEditable)initWithLabel:(id)a3 placeholder:(id)a4 isSecure:(BOOL)a5 isFocused:(BOOL)a6
{
  uint64_t v9 = sub_246426740();
  uint64_t v11 = v10;
  uint64_t v12 = sub_246426740();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionEditable_label);
  uint64_t *v13 = v9;
  v13[1] = v11;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionEditable_placeholder);
  uint64_t *v14 = v12;
  v14[1] = v15;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isSecure) = a5;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isFocused) = a6;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for WKTextExtractionEditable();
  return [(WKTextExtractionEditable *)&v17 init];
}

- (WKTextExtractionEditable)init
{
  result = (WKTextExtractionEditable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end