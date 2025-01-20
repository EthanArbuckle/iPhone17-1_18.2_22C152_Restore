@interface MKPlaceItemActionDataProvider
- (BOOL)canShowCallAction;
- (BOOL)supportsMessagesForBusiness;
- (CNContact)contact;
- (MKMapItem)mapItem;
- (_MKPlaceItem)placeItem;
- (id)messagesForBusinessURL;
- (unint64_t)options;
- (void)updateWithPlaceItem:(id)a3 options:(unint64_t)a4;
@end

@implementation MKPlaceItemActionDataProvider

- (void)updateWithPlaceItem:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_placeItem != __PAIR128__(a4, (unint64_t)v7))
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_placeItem, a3);
    self->_options = a4;
    [(MKPlaceItemActionDataProvider *)self _placeItemDidUpdate];
    id v7 = v8;
  }
}

- (BOOL)supportsMessagesForBusiness
{
  v2 = [(MKPlaceItemActionDataProvider *)self mapItem];
  v3 = [v2 _messageURLString];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)messagesForBusinessURL
{
  if ([(MKPlaceItemActionDataProvider *)self supportsMessagesForBusiness])
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v4 = [(MKPlaceItemActionDataProvider *)self mapItem];
    v5 = [v4 _messageURLString];
    v6 = [v3 URLWithString:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)[(_MKPlaceItem *)self->_placeItem mapItem];
}

- (BOOL)canShowCallAction
{
  v3 = [(MKPlaceItemActionDataProvider *)self contact];
  BOOL v4 = [v3 phoneNumbers];
  if ([v4 count])
  {
    v5 = [(MKPlaceItemActionDataProvider *)self placeItem];
    BOOL v6 = ([v5 options] & 8) == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (CNContact)contact
{
  v3 = [(_MKPlaceItem *)self->_placeItem contact];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    BOOL v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
    id v5 = [v6 _placeCardContact];
  }

  return (CNContact *)v5;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end