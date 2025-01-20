@interface EKUICalendar
+ (BOOL)supportsSecureCoding;
- (EKUICalendar)initWithCoder:(id)a3;
- (EKUICalendar)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation EKUICalendar

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKUICalendar)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
  {
    uint64_t v6 = sub_1DAF99800();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_1DAF99800();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_1DAF99800();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  return (EKUICalendar *)EKUICalendar.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (EKUICalendar)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EKUICalendar();
  return [(EKUICalendar *)&v5 initWithCoder:a3];
}

@end