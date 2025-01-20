@interface AXMTABedtimeUtilities
+ (id)dayStringForRepeatSchedule:(unint64_t)a3;
@end

@implementation AXMTABedtimeUtilities

+ (id)dayStringForRepeatSchedule:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v4 setMonth:1];
  [v4 setYear:2016];
  v5 = 0;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        uint64_t v6 = 8;
        break;
      case 0x20uLL:
        uint64_t v6 = 9;
        break;
      case 0x40uLL:
        uint64_t v6 = 10;
        break;
      default:
        goto LABEL_13;
    }
LABEL_12:
    [v4 setDay:v6];
    v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    v8 = [v7 dateFromComponents:v4];

    v5 = AXDateStringForFormat();
  }
  else
  {
    uint64_t v6 = 4;
    switch(a3)
    {
      case 1uLL:
        goto LABEL_12;
      case 2uLL:
        uint64_t v6 = 5;
        goto LABEL_12;
      case 4uLL:
        uint64_t v6 = 6;
        goto LABEL_12;
      case 8uLL:
        uint64_t v6 = 7;
        goto LABEL_12;
      default:
        break;
    }
  }
LABEL_13:

  return v5;
}

@end