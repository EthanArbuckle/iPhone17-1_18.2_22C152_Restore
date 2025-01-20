@interface CALNRemoteMutatorShared
+ (BOOL)deleteEvent:(id)a3 inEventStore:(id)a4 withSpan:(int64_t)a5 usingRemoteMutator:(id)a6 error:(id *)a7;
@end

@implementation CALNRemoteMutatorShared

+ (BOOL)deleteEvent:(id)a3 inEventStore:(id)a4 withSpan:(int64_t)a5 usingRemoteMutator:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if ([a6 deleteEvent:v11 withSpan:a5]) {
    char v13 = 1;
  }
  else {
    char v13 = [v12 removeEvent:v11 span:a5 error:a7];
  }

  return v13;
}

@end