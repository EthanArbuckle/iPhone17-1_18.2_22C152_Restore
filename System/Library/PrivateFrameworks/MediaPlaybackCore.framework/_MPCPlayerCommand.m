@interface _MPCPlayerCommand
- (MPCPlayerPath)playerPath;
- (MPCPlayerResponse)response;
- (_MPCPlayerCommand)initWithPlayerPath:(id)a3;
- (_MPCPlayerCommand)initWithResponse:(id)a3;
@end

@implementation _MPCPlayerCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (_MPCPlayerCommand)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = [v5 playerPath];
  v7 = [(_MPCPlayerCommand *)self initWithPlayerPath:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_response, a3);
  }

  return v7;
}

- (_MPCPlayerCommand)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MPCPlayerCommand;
  id v5 = [(_MPCPlayerCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    playerPath = v5->_playerPath;
    v5->_playerPath = (MPCPlayerPath *)v6;
  }
  return v5;
}

@end