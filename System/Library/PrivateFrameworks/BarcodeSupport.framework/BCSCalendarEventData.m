@interface BCSCalendarEventData
+ (BOOL)supportsSecureCoding;
- (BCSCalendarEventData)initWithCoder:(id)a3;
- (BCSCalendarEventData)initWithICSString:(id)a3;
- (NSString)extraPreviewText;
- (NSString)icsString;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSCalendarEventData

- (BCSCalendarEventData)initWithICSString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSCalendarEventData;
  v5 = [(BCSCalendarEventData *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    icsString = v5->_icsString;
    v5->_icsString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return 7;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSCalendarEventData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"icsString");

  uint64_t v6 = [(BCSCalendarEventData *)self initWithICSString:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)icsString
{
  return self->_icsString;
}

- (void).cxx_destruct
{
}

@end