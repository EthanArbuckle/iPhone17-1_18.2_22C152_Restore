@interface MPCSceneCollection
- (NSArray)scenes;
- (NSString)version;
- (double)frameRate;
- (void)setFrameRate:(double)a3;
- (void)setScenes:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MPCSceneCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenes, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setScenes:(id)a3
{
}

- (NSArray)scenes
{
  return self->_scenes;
}

- (void)setFrameRate:(double)a3
{
  self->_frameRate = a3;
}

- (double)frameRate
{
  return self->_frameRate;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

@end