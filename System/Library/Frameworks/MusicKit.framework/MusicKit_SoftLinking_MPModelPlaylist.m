@interface MusicKit_SoftLinking_MPModelPlaylist
+ (int64_t)_underlyingMediaSharingModeForSharingMode:(int64_t)a3;
+ (int64_t)_underlyingModelSharingModeForSharingMode:(int64_t)a3;
+ (int64_t)editableComponentsForRawValue:(int64_t)a3;
+ (int64_t)playlistTraitsForRawValue:(int64_t)a3;
+ (int64_t)playlistTypeForRawValue:(int64_t)a3;
+ (int64_t)rawValueForCollaboratorStatus:(unint64_t)a3;
+ (int64_t)rawValueForEditableComponents:(int64_t)a3;
+ (int64_t)rawValueForPlaylistTraits:(int64_t)a3;
+ (int64_t)rawValueForPlaylistType:(int64_t)a3;
+ (int64_t)rawValueForSharingMode:(int64_t)a3;
+ (int64_t)sharingModeForRawValue:(int64_t)a3;
+ (unint64_t)collaboratorStatusForRawValue:(int64_t)a3;
@end

@implementation MusicKit_SoftLinking_MPModelPlaylist

+ (int64_t)rawValueForPlaylistTraits:(int64_t)a3
{
  return a3 & 0x138;
}

+ (unint64_t)collaboratorStatusForRawValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)playlistTypeForRawValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return 0;
  }
  else {
    return qword_21D2F2C18[a3 - 1];
  }
}

+ (int64_t)rawValueForPlaylistType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return 0;
  }
  else {
    return qword_21D2F2C60[a3 - 1];
  }
}

+ (int64_t)editableComponentsForRawValue:(int64_t)a3
{
  return a3 & 3;
}

+ (int64_t)rawValueForEditableComponents:(int64_t)a3
{
  return a3 & 3;
}

+ (int64_t)playlistTraitsForRawValue:(int64_t)a3
{
  return a3 & 0x138;
}

+ (int64_t)sharingModeForRawValue:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)rawValueForSharingMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)_underlyingMediaSharingModeForSharingMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)_underlyingModelSharingModeForSharingMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)rawValueForCollaboratorStatus:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

@end