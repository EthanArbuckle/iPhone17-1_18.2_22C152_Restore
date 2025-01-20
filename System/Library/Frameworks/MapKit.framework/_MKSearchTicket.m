@interface _MKSearchTicket
- (NSString)searchQuery;
- (_MKSearchTicket)initWithSearchTicket:(id)a3;
@end

@implementation _MKSearchTicket

- (_MKSearchTicket)initWithSearchTicket:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKSearchTicket;
  return [(_MKTicket *)&v4 initWithTicket:a3];
}

- (NSString)searchQuery
{
  return (NSString *)[(GEOMapServiceTicket *)self->super._ticket searchQuery];
}

@end