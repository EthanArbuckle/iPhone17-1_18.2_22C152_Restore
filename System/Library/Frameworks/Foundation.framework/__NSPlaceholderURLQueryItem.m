@interface __NSPlaceholderURLQueryItem
- (__NSPlaceholderURLQueryItem)init;
- (__NSPlaceholderURLQueryItem)initWithName:(id)a3 value:(id)a4;
- (unint64_t)retainCount;
@end

@implementation __NSPlaceholderURLQueryItem

- (__NSPlaceholderURLQueryItem)initWithName:(id)a3 value:(id)a4
{
  if (!_NSIsNSString()) {
    a3 = &stru_1ECA5C228;
  }
  if (_NSIsNSString()) {
    id v6 = a4;
  }
  else {
    id v6 = 0;
  }
  id v7 = +[NSURLQueryItem _queryItemWithName:a3 value:v6];

  return (__NSPlaceholderURLQueryItem *)v7;
}

- (__NSPlaceholderURLQueryItem)init
{
  id v2 = +[NSURLQueryItem _queryItem];

  return (__NSPlaceholderURLQueryItem *)v2;
}

- (unint64_t)retainCount
{
  return -1;
}

@end