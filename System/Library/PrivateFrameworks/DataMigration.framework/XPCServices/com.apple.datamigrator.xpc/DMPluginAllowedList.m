@interface DMPluginAllowedList
- (id)concurrentUserSpecificPluginSpecifiers;
- (id)orderedUserAgnosticPluginSpecifiers;
- (id)orderedUserSpecificPluginSpecifiers;
@end

@implementation DMPluginAllowedList

- (id)orderedUserAgnosticPluginSpecifiers
{
  if (qword_100030C18 != -1) {
    dispatch_once(&qword_100030C18, &stru_100024AC0);
  }
  v2 = (void *)qword_100030C10;

  return v2;
}

- (id)orderedUserSpecificPluginSpecifiers
{
  if (qword_100030C28 != -1) {
    dispatch_once(&qword_100030C28, &stru_100024AE0);
  }
  v2 = (void *)qword_100030C20;

  return v2;
}

- (id)concurrentUserSpecificPluginSpecifiers
{
  if (qword_100030C38 != -1) {
    dispatch_once(&qword_100030C38, &stru_100024B00);
  }
  v2 = (void *)qword_100030C30;

  return v2;
}

@end