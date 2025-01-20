@interface _MPCPlayerFeedbackCommand
- (BOOL)isDislikingFavoritableModelObject;
- (BOOL)value;
- (MPModelObject)favoritableModelObject;
- (NSString)localizedShortTitle;
- (NSString)localizedTitle;
- (_MPCPlayerFeedbackCommand)initWithResponse:(id)a3 mediaRemoteCommand:(unsigned int)a4;
- (id)changeValue:(BOOL)a3;
- (int64_t)presentationStyle;
- (unsigned)command;
- (void)setFavoritableModelObject:(id)a3;
- (void)setIsDislikingFavoritableModelObject:(BOOL)a3;
- (void)setLocalizedShortTitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation _MPCPlayerFeedbackCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritableModelObject, 0);
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (void)setFavoritableModelObject:(id)a3
{
}

- (MPModelObject)favoritableModelObject
{
  return self->_favoritableModelObject;
}

- (void)setIsDislikingFavoritableModelObject:(BOOL)a3
{
  self->_isDislikingFavoritableModelObject = a3;
}

- (BOOL)isDislikingFavoritableModelObject
{
  return self->_isDislikingFavoritableModelObject;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setLocalizedShortTitle:(id)a3
{
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (unsigned)command
{
  return self->_command;
}

- (id)changeValue:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_MPCPlayerFeedbackCommand *)self favoritableModelObject];

  if (v5)
  {
    v6 = [(_MPCPlayerCommand *)self response];
    if ([(_MPCPlayerFeedbackCommand *)self isDislikingFavoritableModelObject]) {
      v7 = MPCPlayerSuggestLessCommandRequest;
    }
    else {
      v7 = MPCPlayerFavoriteCommandRequest;
    }
    id v19 = [v7 alloc];
    v12 = [(_MPCPlayerFeedbackCommand *)self favoritableModelObject];
    v15 = [v6 controller];
    v16 = [v6 request];
    v17 = [v16 label];
    uint64_t v18 = [v19 initWithModelObject:v12 value:v3 controller:v15 label:v17];
  }
  else
  {
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    v6 = v8;
    if (!v3) {
      [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F54CE8]];
    }
    v9 = [(_MPCPlayerItemCommand *)self contentItemID];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = [(_MPCPlayerItemCommand *)self contentItemID];
      [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x263F54C98]];
    }
    v12 = [(_MPCPlayerCommand *)self response];
    v13 = [MPCPlayerCommandRequest alloc];
    uint64_t v14 = [(_MPCPlayerFeedbackCommand *)self command];
    v15 = [v12 controller];
    v16 = [v12 request];
    v17 = [v16 label];
    uint64_t v18 = [(MPCPlayerCommandRequest *)v13 initWithMediaRemoteCommand:v14 options:v6 controller:v15 label:v17];
  }
  v20 = (void *)v18;

  return v20;
}

- (_MPCPlayerFeedbackCommand)initWithResponse:(id)a3 mediaRemoteCommand:(unsigned int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_MPCPlayerFeedbackCommand;
  result = [(_MPCPlayerCommand *)&v6 initWithResponse:a3];
  if (result) {
    result->_command = a4;
  }
  return result;
}

@end