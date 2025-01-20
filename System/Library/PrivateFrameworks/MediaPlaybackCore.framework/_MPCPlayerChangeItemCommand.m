@interface _MPCPlayerChangeItemCommand
- (_MPCPlayerChangeItemCommand)initWithResponse:(id)a3 changeItemSupport:(unint64_t)a4;
- (id)changeToItem:(id)a3;
- (id)changeToSection:(id)a3;
- (id)nextChapter;
- (id)nextItem;
- (id)nextSection;
- (id)previousChapter;
- (id)previousItem;
- (id)previousItemDeferringToPlaybackQueuePosition;
- (id)previousSection;
- (unint64_t)changeItemSupport;
@end

@implementation _MPCPlayerChangeItemCommand

- (id)nextItem
{
  if ((self->_changeItemSupport & 0x10) != 0)
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    v5 = [v3 tracklist];
    v6 = [v5 playingItem];
    v7 = [v6 contentItemIdentifier];

    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F54CF8]];
    }
    v8 = [MPCPlayerCommandRequest alloc];
    v9 = [v3 controller];
    v10 = [v3 request];
    v11 = [v10 label];
    v2 = [(MPCPlayerCommandRequest *)v8 initWithMediaRemoteCommand:4 options:v4 controller:v9 label:v11];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)previousItem
{
  if ((self->_changeItemSupport & 2) != 0)
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    v5 = [v3 tracklist];
    v6 = [v5 playingItem];
    v7 = [v6 contentItemIdentifier];

    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F54CF8]];
    }
    v8 = [MPCPlayerCommandRequest alloc];
    v9 = [v3 controller];
    v10 = [v3 request];
    v11 = [v10 label];
    v2 = [(MPCPlayerCommandRequest *)v8 initWithMediaRemoteCommand:5 options:v4 controller:v9 label:v11];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (_MPCPlayerChangeItemCommand)initWithResponse:(id)a3 changeItemSupport:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_MPCPlayerChangeItemCommand;
  result = [(_MPCPlayerCommand *)&v6 initWithResponse:a3];
  if (result) {
    result->_changeItemSupport = a4;
  }
  return result;
}

- (id)previousSection
{
  if ((self->_changeItemSupport & 4) != 0)
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MPCPlayerCommandRequest alloc];
    v5 = [v3 controller];
    objc_super v6 = [v3 request];
    v7 = [v6 label];
    v2 = [(MPCPlayerCommandRequest *)v4 initWithMediaRemoteCommand:110 options:0 controller:v5 label:v7];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)previousChapter
{
  if ((self->_changeItemSupport & 8) != 0)
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MPCPlayerCommandRequest alloc];
    v5 = [v3 controller];
    objc_super v6 = [v3 request];
    v7 = [v6 label];
    v2 = [(MPCPlayerCommandRequest *)v4 initWithMediaRemoteCommand:101 options:0 controller:v5 label:v7];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)nextSection
{
  if ((self->_changeItemSupport & 0x20) != 0)
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MPCPlayerCommandRequest alloc];
    v5 = [v3 controller];
    objc_super v6 = [v3 request];
    v7 = [v6 label];
    v2 = [(MPCPlayerCommandRequest *)v4 initWithMediaRemoteCommand:109 options:0 controller:v5 label:v7];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)nextChapter
{
  if ((self->_changeItemSupport & 0x40) != 0)
  {
    v3 = [(_MPCPlayerCommand *)self response];
    v4 = [MPCPlayerCommandRequest alloc];
    v5 = [v3 controller];
    objc_super v6 = [v3 request];
    v7 = [v6 label];
    v2 = [(MPCPlayerCommandRequest *)v4 initWithMediaRemoteCommand:100 options:0 controller:v5 label:v7];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (unint64_t)changeItemSupport
{
  return self->_changeItemSupport;
}

- (id)changeToItem:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((self->_changeItemSupport & 0x80) == 0) {
    goto LABEL_3;
  }
  v5 = [(_MPCPlayerCommand *)self response];
  objc_super v6 = [v4 response];
  uint64_t v7 = v5 == v6;

  v8 = [(_MPCPlayerCommand *)self response];
  v9 = [v8 builder];
  v10 = [v4 indexPath];
  v11 = [(_MPCPlayerCommand *)self response];
  v12 = [v11 chain];
  LOBYTE(v7) = [v9 playerItemShouldDisableJumpToItem:0 atIndexPath:v10 boundsCheck:v7 chain:v12];

  if ((v7 & 1) == 0)
  {
    v14 = [v4 metadataObject];
    v15 = [v14 identifiers];
    v16 = [v15 contentItemID];

    if ([v16 length])
    {
      uint64_t v24 = *MEMORY[0x263F54C98];
      v25[0] = v16;
      v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      v18 = [(_MPCPlayerCommand *)self response];
      v19 = [MPCPlayerCommandRequest alloc];
      v20 = [v18 controller];
      v21 = [v18 request];
      v22 = [v21 label];
      v13 = [(MPCPlayerCommandRequest *)v19 initWithMediaRemoteCommand:131 options:v17 controller:v20 label:v22];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
LABEL_3:
    v13 = 0;
  }

  return v13;
}

- (id)changeToSection:(id)a3
{
  return 0;
}

- (id)previousItemDeferringToPlaybackQueuePosition
{
  v12[1] = *MEMORY[0x263EF8340];
  if ((self->_changeItemSupport & 2) != 0)
  {
    uint64_t v11 = *MEMORY[0x263F54D70];
    v12[0] = MEMORY[0x263EFFA88];
    id v4 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v5 = [(_MPCPlayerCommand *)self response];
    objc_super v6 = [MPCPlayerCommandRequest alloc];
    uint64_t v7 = [v5 controller];
    v8 = [v5 request];
    v9 = [v8 label];
    v2 = [(MPCPlayerCommandRequest *)v6 initWithMediaRemoteCommand:5 options:v4 controller:v7 label:v9];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end