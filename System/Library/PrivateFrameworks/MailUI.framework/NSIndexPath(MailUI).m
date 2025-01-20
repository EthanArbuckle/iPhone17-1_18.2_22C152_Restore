@interface NSIndexPath(MailUI)
- (uint64_t)ef_publicDescription;
- (uint64_t)mui_nextIndexPath;
- (unint64_t)mui_distanceTo:()MailUI;
@end

@implementation NSIndexPath(MailUI)

- (uint64_t)ef_publicDescription
{
  return objc_msgSend(NSString, "stringWithFormat:", @"{%ld - %ld}", objc_msgSend(a1, "section"), objc_msgSend(a1, "item"));
}

- (unint64_t)mui_distanceTo:()MailUI
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [v4 section];
  if (v6 >= v7)
  {
    if (v6 <= v7)
    {
      uint64_t v9 = [v4 item];
      unint64_t v8 = v9 - [v5 item];
    }
    else
    {
      unint64_t v8 = 0x8000000000000000;
    }
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (uint64_t)mui_nextIndexPath
{
  v2 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v3 = [a1 item] + 1;
  uint64_t v4 = [a1 section];
  return [v2 indexPathForItem:v3 inSection:v4];
}

@end