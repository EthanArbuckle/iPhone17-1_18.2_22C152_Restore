@interface IAGenmojiAnalytics
+ (id)genmojiCreationFailReasonToEnumMap;
+ (id)genmojiCreationSignalToEnumMap;
@end

@implementation IAGenmojiAnalytics

+ (id)genmojiCreationSignalToEnumMap
{
  if (qword_269C40288 != -1) {
    dispatch_once(&qword_269C40288, &unk_2702E3888);
  }
  v2 = (void *)qword_269C40280;
  return v2;
}

+ (id)genmojiCreationFailReasonToEnumMap
{
  if (qword_269C40298 != -1) {
    dispatch_once(&qword_269C40298, &unk_2702E3A08);
  }
  v2 = (void *)qword_269C40290;
  return v2;
}

@end