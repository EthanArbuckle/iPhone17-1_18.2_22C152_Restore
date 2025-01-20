@interface CalDAVCalendarServerUpdateItem
- (CalDAVCalendarServerUpdateItem)init;
@end

@implementation CalDAVCalendarServerUpdateItem

- (CalDAVCalendarServerUpdateItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"update"];
}

@end