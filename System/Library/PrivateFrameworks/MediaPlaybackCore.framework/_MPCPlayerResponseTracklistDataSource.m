@interface _MPCPlayerResponseTracklistDataSource
- (MPCPlayerResponse)response;
- (NSIndexPath)playingItemIndexPath;
- (_MPCPlayerResponseTracklistDataSource)initWithResponse:(id)a3 playingItemIndexPath:(id)a4;
- (id)_responseParticipantForParticipantItem:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)setPlayingItemIndexPath:(id)a3;
@end

@implementation _MPCPlayerResponseTracklistDataSource

- (_MPCPlayerResponseTracklistDataSource)initWithResponse:(id)a3 playingItemIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MPCPlayerResponseTracklistDataSource;
  v8 = [(_MPCPlayerResponseTracklistDataSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_response, v6);
    objc_storeStrong((id *)&v9->_playingItemIndexPath, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);

  objc_destroyWeak((id *)&self->_response);
}

- (unint64_t)numberOfSections
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  v4 = [WeakRetained chain];
  unint64_t v5 = [v3 playerNumberOfSections:0 chain:v4];

  return v5;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  unint64_t v5 = [WeakRetained builder];
  id v6 = [WeakRetained chain];
  unint64_t v7 = [v5 playerNumberOfItems:0 inSection:a3 chain:v6];

  return v7;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  unint64_t v5 = [WeakRetained request];
  id v6 = [v5 queueSectionProperties];

  if (v6)
  {
    unint64_t v7 = [WeakRetained builder];
    v8 = [MEMORY[0x263F088C8] indexPathWithIndex:a3];
    v9 = [WeakRetained chain];
    v10 = [v7 playerModelObject:0 propertySet:v6 atIndexPath:v8 chain:v9];

    objc_super v11 = [[MPCPlayerResponseSection alloc] initWithModelGenericObject:v10 sectionIndex:a3 response:WeakRetained];
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  id v6 = [WeakRetained request];
  unint64_t v7 = [v6 queueItemProperties];

  v8 = [(_MPCPlayerResponseTracklistDataSource *)self playingItemIndexPath];
  int v9 = [v4 isEqual:v8];

  if (v9)
  {
    v10 = [WeakRetained request];
    uint64_t v11 = [v10 playingItemProperties];

    unint64_t v7 = (void *)v11;
  }
  v12 = [WeakRetained builder];
  v13 = [WeakRetained chain];
  v14 = [v12 playerModelObject:0 propertySet:v7 atIndexPath:v4 chain:v13];

  v15 = [WeakRetained builder];
  v16 = [WeakRetained chain];
  v17 = [v15 participant:0 atIndexPath:v4 chain:v16];

  v18 = [(_MPCPlayerResponseTracklistDataSource *)self _responseParticipantForParticipantItem:v17];
  v19 = [[MPCPlayerResponseItem alloc] initWithModelGenericObject:v14 indexPath:v4 enqueueingParticipant:v18 response:WeakRetained];

  return v19;
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (id)_responseParticipantForParticipantItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = [MPCPlayerResponseParticipant alloc];
    id v6 = [v4 identifier];
    uint64_t v7 = [v4 participantIdentifierType];
    v8 = [v4 participantIdentifier];
    int v9 = [v4 displayName];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    uint64_t v11 = [(MPCPlayerResponseParticipant *)v5 initWithIdentifier:v6 identifierType:v7 participantIdentifier:v8 displayName:v9 response:WeakRetained];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)setPlayingItemIndexPath:(id)a3
{
}

- (MPCPlayerResponse)response
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);

  return (MPCPlayerResponse *)WeakRetained;
}

@end