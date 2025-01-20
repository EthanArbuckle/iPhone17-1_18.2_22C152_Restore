@interface AVMusicTrack(AVMusicTrackEditor)
- (BOOL)usesAutomatedParameters;
- (void)setUsesAutomatedParameters:()AVMusicTrackEditor;
@end

@implementation AVMusicTrack(AVMusicTrackEditor)

- (void)setUsesAutomatedParameters:()AVMusicTrackEditor
{
}

- (BOOL)usesAutomatedParameters
{
  return MusicTrackImpl::UsesAutomatedParams(*(MusicTrackImpl **)self->_impl);
}

@end