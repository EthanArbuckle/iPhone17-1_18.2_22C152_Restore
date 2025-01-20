@interface _GEOIdentifiersTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEOIdentifiersTicket)initWithIdentifiers:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 options:(unint64_t)a7;
- (_GEOIdentifiersTicket)initWithMUIDs:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 options:(unint64_t)a7;
- (_GEOIdentifiersTicket)initWithTraits:(id)a3;
- (id)description;
- (void)cancel;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOIdentifiersTicket

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    if (self->_identifiers)
    {
      unint64_t options = self->_options;
      unint64_t v13 = [(GEOAbstractTicket *)self cachePolicy];
      if (v13 - 1 > 3) {
        unint64_t v22 = options;
      }
      else {
        unint64_t v22 = qword_18A632C50[v13 - 1];
      }
      v15 = +[GEOPlaceCardRequester sharedRequester];
      identifiers = self->_identifiers;
      uint64_t resultProviderID = self->_resultProviderID;
      traits = self->super.super._traits;
      throttlerToken = self->super.super._throttlerToken;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __78___GEOIdentifiersTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
      v23[3] = &unk_1E53DEA28;
      v23[4] = self;
      id v24 = v9;
      v20 = [v15 requestIdentifiers:identifiers resultProviderID:resultProviderID traits:traits options:v22 auditToken:v10 throttleToken:throttlerToken networkActivity:v11 requesterHandler:v23];
      id requestToken = self->_requestToken;
      self->_id requestToken = v20;
    }
    else
    {
      v14 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"ticket was created with no identifiers"];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
    }
  }
}

- (_GEOIdentifiersTicket)initWithIdentifiers:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 options:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_GEOIdentifiersTicket;
  v14 = [(GEOAbstractTicket *)&v21 initWithTraits:a6];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    identifiers = v14->_identifiers;
    v14->_identifiers = (NSArray *)v15;

    v14->_uint64_t resultProviderID = a4;
    uint64_t v17 = [v13 copy];
    contentProvider = v14->_contentProvider;
    v14->_contentProvider = (NSString *)v17;

    v14->_unint64_t options = a7;
    v14->super._searchResultType = 0;
    v14->super._mapDisplayType = 0;
    v19 = v14;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong(&self->_requestToken, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (_GEOIdentifiersTicket)initWithTraits:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOIdentifiersTicket;
  return [(GEOAbstractTicket *)&v4 initWithTraits:a3];
}

- (_GEOIdentifiersTicket)initWithMUIDs:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 options:(unint64_t)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v22 = a5;
  id v11 = a6;
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [*(id *)(*((void *)&v24 + 1) + 8 * v17) unsignedLongLongValue], v9, -180.0, -180.0);
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  v19 = [(_GEOIdentifiersTicket *)self initWithIdentifiers:v12 resultProviderID:v9 contentProvider:v22 traits:v11 options:a7];
  return v19;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_GEOIdentifiersTicket;
  objc_super v4 = [(GEOAbstractTicket *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ identifiers: %@", v4, self->_identifiers];

  return v5;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v2 = [(GEOMapServiceTraits *)self->super.super._traits requestPriority];
  $C4D369C9F02205611300857CFD58F739 v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000500;
  if (v2 != 1) {
    $C4D369C9F02205611300857CFD58F739 v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000300;
  }
  if (v2 == 2) {
    return ($C4D369C9F02205611300857CFD58F739)0x1700000700;
  }
  else {
    return v3;
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOIdentifiersTicket;
  [(GEOAbstractTicket *)&v4 cancel];
  $C4D369C9F02205611300857CFD58F739 v3 = +[GEOPlaceCardRequester sharedRequester];
  [v3 cancelRequest:self->_requestToken];
}

@end