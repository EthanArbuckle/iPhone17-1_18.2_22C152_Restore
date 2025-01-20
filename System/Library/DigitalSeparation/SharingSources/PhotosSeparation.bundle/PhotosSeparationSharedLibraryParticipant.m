@interface PhotosSeparationSharedLibraryParticipant
- (BOOL)isCurrentUser;
- (PhotosSeparationSharedLibraryParticipant)initWithShareParticipant:(id)a3;
- (id)nameComponents;
- (id)representedObject;
- (id)uuid;
@end

@implementation PhotosSeparationSharedLibraryParticipant

- (void).cxx_destruct
{
}

- (id)nameComponents
{
  return [(PHShareParticipant *)self->_shareParticipant nameComponents];
}

- (id)uuid
{
  return [(PHShareParticipant *)self->_shareParticipant uuid];
}

- (id)representedObject
{
  return self->_shareParticipant;
}

- (BOOL)isCurrentUser
{
  return [(PHShareParticipant *)self->_shareParticipant isCurrentUser];
}

- (PhotosSeparationSharedLibraryParticipant)initWithShareParticipant:(id)a3
{
  id v5 = a3;
  uint64_t v6 = 1;
  if ([v5 role] == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  if ([v5 permission] == 3) {
    uint64_t v6 = 2;
  }
  v8 = [v5 emailAddress];
  v9 = [v5 phoneNumber];
  v12.receiver = self;
  v12.super_class = (Class)PhotosSeparationSharedLibraryParticipant;
  v10 = [(PhotosSeparationParticipant *)&v12 initWithRole:v7 permission:v6 emailAddress:v8 phoneNumber:v9];

  if (v10) {
    objc_storeStrong((id *)&v10->_shareParticipant, a3);
  }

  return v10;
}

@end