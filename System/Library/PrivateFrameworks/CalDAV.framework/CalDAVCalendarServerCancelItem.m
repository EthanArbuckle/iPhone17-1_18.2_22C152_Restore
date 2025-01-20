@interface CalDAVCalendarServerCancelItem
- (CalDAVCalendarServerCancelItem)init;
@end

@implementation CalDAVCalendarServerCancelItem

- (CalDAVCalendarServerCancelItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"cancel"];
}

@end