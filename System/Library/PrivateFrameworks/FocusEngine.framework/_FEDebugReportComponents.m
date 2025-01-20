@interface _FEDebugReportComponents
- (NSString)body;
- (NSString)footer;
- (NSString)header;
- (_FEDebugReportComponents)init;
- (void)setBody:(id)a3;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
@end

@implementation _FEDebugReportComponents

- (_FEDebugReportComponents)init
{
  v8.receiver = self;
  v8.super_class = (Class)_FEDebugReportComponents;
  v2 = [(_FEDebugReportComponents *)&v8 init];
  v3 = v2;
  if (v2)
  {
    header = v2->_header;
    v2->_header = (NSString *)&stru_2700CBC00;

    body = v3->_body;
    v3->_body = (NSString *)&stru_2700CBC00;

    footer = v3->_footer;
    v3->_footer = (NSString *)&stru_2700CBC00;
  }
  return v3;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end