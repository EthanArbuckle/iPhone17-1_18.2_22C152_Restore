@interface IOSLocaleData
+ (void)initLocaleDataImplWithNSString:(id)a3 withLibcoreIcuLocaleData:(id)a4;
@end

@implementation IOSLocaleData

+ (void)initLocaleDataImplWithNSString:(id)a3 withLibcoreIcuLocaleData:(id)a4
{
  id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:a3];
  id v6 = objc_alloc_init((Class)NSDateFormatter);
  [v6 setLocale:v5];
  uint64_t v7 = NSString_class_();
  v8 = +[IOSObjectArray arrayWithLength:2 type:v7];
  -[IOSObjectArray replaceObjectAtIndex:withObject:](v8, "replaceObjectAtIndex:withObject:", 0, [v6 AMSymbol]);
  -[IOSObjectArray replaceObjectAtIndex:withObject:](v8, "replaceObjectAtIndex:withObject:", 1, [v6 PMSymbol]);
  JreStrongAssign((id *)a4 + 3, v8);
  JreStrongAssign((id *)a4 + 4, +[IOSObjectArray arrayWithNSArray:type:](IOSObjectArray, "arrayWithNSArray:type:", [v6 eraSymbols], v7));
  JreStrongAssign((id *)a4 + 5, +[IOSObjectArray arrayWithNSArray:type:](IOSObjectArray, "arrayWithNSArray:type:", [v6 monthSymbols], v7));
  JreStrongAssign((id *)a4 + 6, +[IOSObjectArray arrayWithNSArray:type:](IOSObjectArray, "arrayWithNSArray:type:", [v6 shortMonthSymbols], v7));
  JreStrongAssign((id *)a4 + 7, +[IOSObjectArray arrayWithNSArray:type:](IOSObjectArray, "arrayWithNSArray:type:", [v6 veryShortMonthSymbols], v7));
  JreStrongAssign((id *)a4 + 8, +[IOSObjectArray arrayWithNSArray:type:](IOSObjectArray, "arrayWithNSArray:type:", [v6 standaloneMonthSymbols], v7));
  JreStrongAssign((id *)a4 + 9, +[IOSObjectArray arrayWithNSArray:type:](IOSObjectArray, "arrayWithNSArray:type:", [v6 shortStandaloneMonthSymbols], v7));
  JreStrongAssign((id *)a4 + 10, +[IOSObjectArray arrayWithNSArray:type:](IOSObjectArray, "arrayWithNSArray:type:", [v6 veryShortStandaloneMonthSymbols], v7));
  v9 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v6 weekdaySymbols]);
  [(NSMutableArray *)v9 insertObject:&stru_10048C1F8 atIndex:0];
  JreStrongAssign((id *)a4 + 11, +[IOSObjectArray arrayWithNSArray:v9 type:v7]);
  v10 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v6 shortWeekdaySymbols]);
  [(NSMutableArray *)v10 insertObject:&stru_10048C1F8 atIndex:0];
  JreStrongAssign((id *)a4 + 12, +[IOSObjectArray arrayWithNSArray:v10 type:v7]);
  v11 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v6 veryShortWeekdaySymbols]);
  [(NSMutableArray *)v11 insertObject:&stru_10048C1F8 atIndex:0];
  JreStrongAssign((id *)a4 + 13, +[IOSObjectArray arrayWithNSArray:v11 type:v7]);
  v12 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v6 standaloneWeekdaySymbols]);
  [(NSMutableArray *)v12 insertObject:&stru_10048C1F8 atIndex:0];
  JreStrongAssign((id *)a4 + 14, +[IOSObjectArray arrayWithNSArray:v12 type:v7]);
  v13 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v6 shortStandaloneWeekdaySymbols]);
  [(NSMutableArray *)v13 insertObject:&stru_10048C1F8 atIndex:0];
  JreStrongAssign((id *)a4 + 15, +[IOSObjectArray arrayWithNSArray:v13 type:v7]);
  v14 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v6 veryShortStandaloneWeekdaySymbols]);
  [(NSMutableArray *)v14 insertObject:&stru_10048C1F8 atIndex:0];
  JreStrongAssign((id *)a4 + 16, +[IOSObjectArray arrayWithNSArray:v14 type:v7]);
  [v6 setTimeStyle:0];
  [v6 setDateStyle:2];
  [v6 setDoesRelativeDateFormatting:1];
  v15 = +[NSDate date];
  JreStrongAssign((id *)a4 + 18, [v6 stringFromDate:v15]);
  JreStrongAssign((id *)a4 + 17, objc_msgSend(v6, "stringFromDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, -86400.0)));
  JreStrongAssign((id *)a4 + 19, objc_msgSend(v6, "stringFromDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v15, 86400.0)));
  [v6 setDoesRelativeDateFormatting:0];
  [v6 setDateStyle:0];
  [v6 setTimeStyle:4];
  JreStrongAssign((id *)a4 + 20, [v6 dateFormat]);
  [v6 setTimeStyle:3];
  JreStrongAssign((id *)a4 + 21, [v6 dateFormat]);
  [v6 setTimeStyle:2];
  JreStrongAssign((id *)a4 + 22, [v6 dateFormat]);
  [v6 setTimeStyle:1];
  JreStrongAssign((id *)a4 + 23, [v6 dateFormat]);
  [v6 setTimeStyle:0];
  [v6 setDateStyle:4];
  JreStrongAssign((id *)a4 + 24, [v6 dateFormat]);
  [v6 setDateStyle:3];
  JreStrongAssign((id *)a4 + 25, [v6 dateFormat]);
  [v6 setDateStyle:2];
  JreStrongAssign((id *)a4 + 26, [v6 dateFormat]);
  [v6 setDateStyle:1];
  JreStrongAssign((id *)a4 + 27, [v6 dateFormat]);
  id v20 = objc_alloc_init((Class)NSNumberFormatter);
  [v20 setNumberStyle:0];
  [v20 setLocale:v5];
  *((_WORD *)a4 + 112) = (unsigned __int16)objc_msgSend(objc_msgSend(v20, "zeroSymbol"), "characterAtIndex:", 0);
  if (!*((_WORD *)a4 + 112)) {
    *((_WORD *)a4 + 112) = 48;
  }
  *((_WORD *)a4 + 113) = (unsigned __int16)objc_msgSend(objc_msgSend(v20, "decimalSeparator"), "characterAtIndex:", 0);
  *((_WORD *)a4 + 114) = (unsigned __int16)objc_msgSend(objc_msgSend(v20, "groupingSeparator"), "characterAtIndex:", 0);
  *((_WORD *)a4 + 116) = (unsigned __int16)objc_msgSend(objc_msgSend(v20, "percentSymbol"), "characterAtIndex:", 0);
  *((_WORD *)a4 + 117) = (unsigned __int16)objc_msgSend(objc_msgSend(v20, "perMillSymbol"), "characterAtIndex:", 0);
  *((_WORD *)a4 + 118) = (unsigned __int16)objc_msgSend(objc_msgSend(v20, "currencyGroupingSeparator"), "characterAtIndex:", 0);
  *((_WORD *)a4 + 119) = (unsigned __int16)objc_msgSend(objc_msgSend(v20, "minusSign"), "characterAtIndex:", 0);
  JreStrongAssign((id *)a4 + 30, [v20 exponentSymbol]);
  JreStrongAssign((id *)a4 + 31, [v20 positiveInfinitySymbol]);
  JreStrongAssign((id *)a4 + 32, [v20 notANumberSymbol]);
  JreStrongAssign((id *)a4 + 33, [v20 currencySymbol]);
  JreStrongAssign((id *)a4 + 34, [v20 internationalCurrencySymbol]);
  [v20 setNumberStyle:1];
  [v20 setAllowsFloats:0];
  JreStrongAssign((id *)a4 + 36, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@",
      [v20 positiveFormat],
      [v20 negativeFormat]));
  [v20 setAllowsFloats:1];
  JreStrongAssign((id *)a4 + 35, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@",
      [v20 positiveFormat],
      [v20 negativeFormat]));
  [v20 setNumberStyle:2];
  JreStrongAssign((id *)a4 + 37, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@",
      [v20 positiveFormat],
      [v20 negativeFormat]));
  [v20 setNumberStyle:3];
  JreStrongAssign((id *)a4 + 38, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@",
      [v20 positiveFormat],
      [v20 negativeFormat]));
  v16 = +[NSCalendar currentCalendar];
  v17 = [(NSCalendar *)v16 locale];
  [(NSCalendar *)v16 setLocale:v5];
  v18 = JavaLangInteger_valueOfWithInt_((int)[(NSCalendar *)v16 firstWeekday]);
  JreStrongAssign((id *)a4 + 1, v18);
  v19 = JavaLangInteger_valueOfWithInt_((int)[(NSCalendar *)v16 minimumDaysInFirstWeek]);
  JreStrongAssign((id *)a4 + 2, v19);
  [(NSCalendar *)v16 setLocale:v17];
}

@end