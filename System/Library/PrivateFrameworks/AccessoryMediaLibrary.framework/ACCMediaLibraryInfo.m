@interface ACCMediaLibraryInfo
- (ACCMediaLibraryInfo)initWithInfo:(id)a3;
- (ACCMediaLibraryUpdateLibraryInfo)info;
- (BOOL)getState:(int)a3;
- (BOOL)setState:(int)a3 value:(BOOL)a4;
- (NSString)libraryUID;
- (id)description;
@end

@implementation ACCMediaLibraryInfo

- (ACCMediaLibraryInfo)initWithInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCMediaLibraryInfo;
  v6 = [(ACCMediaLibraryInfo *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 mediaLibraryUID];
    libraryUID = v6->_libraryUID;
    v6->_libraryUID = (NSString *)v7;

    objc_storeStrong((id *)&v6->_info, a3);
    *(_DWORD *)v6->_state = 0;
  }

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCMediaLibraryInfo>[%@ state=[%d %d] info=%@]", self->_libraryUID, self->_state[0], self->_state[1], self->_info];
}

- (BOOL)setState:(int)a3 value:(BOOL)a4
{
  BOOL v4 = !self->_stateInit[a3] || self->_state[a3] != a4;
  self->_state[a3] = a4;
  self->_stateInit[a3] = 1;
  return v4;
}

- (BOOL)getState:(int)a3
{
  return self->_state[a3];
}

- (NSString)libraryUID
{
  return self->_libraryUID;
}

- (ACCMediaLibraryUpdateLibraryInfo)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_libraryUID, 0);
}

@end