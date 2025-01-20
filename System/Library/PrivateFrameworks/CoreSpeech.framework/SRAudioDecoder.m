@interface SRAudioDecoder
+ (unint64_t)totalFrames:(id)a3;
- (SRAudioDecoder)init;
- (SRAudioDecoder)initWithStreamDescription:(AudioStreamBasicDescription *)a3 error:(id *)a4;
- (id)decodeAudio:(id)a3 error:(id *)a4;
- (id)endWithError:(id *)a3;
@end

@implementation SRAudioDecoder

- (SRAudioDecoder)initWithStreamDescription:(AudioStreamBasicDescription *)a3 error:(id *)a4
{
  Float64 mSampleRate = a3->mSampleRate;
  long long v5 = *(_OWORD *)&a3->mBytesPerFrame;
  long long v10 = *(_OWORD *)&a3->mFormatID;
  long long v11 = v5;
  type metadata accessor for OpusDecoder();
  swift_allocObject();
  v6 = self;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___SRAudioDecoder_decoder) = (Class)OpusDecoder.init(destinationFormat:)();

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for SRAudioDecoder();
  return [(SRAudioDecoder *)&v8 init];
}

- (id)decodeAudio:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  v7 = (void *)dispatch thunk of OpusDecoder.decode(audio:)();

  return v7;
}

- (id)endWithError:(id *)a3
{
  v3 = self;
  v4 = (void *)dispatch thunk of OpusDecoder.end()();

  return v4;
}

+ (unint64_t)totalFrames:(id)a3
{
  id v3 = a3;
  unint64_t v4 = AudioData.sampleCount.getter();

  return v4;
}

- (SRAudioDecoder)init
{
  result = (SRAudioDecoder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end