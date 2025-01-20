@interface EKCalendar
- (id)nanoPrivacyAwareDescription;
@end

@implementation EKCalendar

- (id)nanoPrivacyAwareDescription
{
  if (qword_28378 != -1) {
    dispatch_once(&qword_28378, &stru_20A98);
  }
  int v3 = byte_28380;
  v4 = [(EKCalendar *)self objectID];
  v5 = [(EKCalendar *)self title];
  v6 = v5;
  if (v3) {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cal objectID=%@; title=%@; type=%li; allowsMod=%d",
  }
      v4,
      v5,
      [(EKCalendar *)self type],
      [(EKCalendar *)self allowsContentModifications]);
  else {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cal objectID=%@; titleLen=%lu; type=%li; allowsMod=%d",
  }
      v4,
      [v5 length],
      [(EKCalendar *)self type],
  v7 = [(EKCalendar *)self allowsContentModifications]);

  return v7;
}

@end