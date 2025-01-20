@interface _CDPortraitStreams
+ (id)allStreams;
+ (id)entityStream;
+ (id)topicStream;
@end

@implementation _CDPortraitStreams

+ (id)topicStream
{
  return +[_DKEventStream eventStreamWithName:@"/portrait/topic"];
}

+ (id)entityStream
{
  return +[_DKEventStream eventStreamWithName:@"/portrait/entity"];
}

+ (id)allStreams
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 topicStream];
  v7[0] = v3;
  v4 = [a1 entityStream];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

@end