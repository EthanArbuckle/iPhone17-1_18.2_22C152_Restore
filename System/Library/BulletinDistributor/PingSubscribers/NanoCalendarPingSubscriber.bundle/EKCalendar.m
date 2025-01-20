@interface EKCalendar
- (id)nanoPrivacyAwareDescription;
@end

@implementation EKCalendar

- (id)nanoPrivacyAwareDescription
{
  if (qword_10DB8 != -1) {
    dispatch_once(&qword_10DB8, &stru_C6A8);
  }
  int v3 = byte_10DC0;
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