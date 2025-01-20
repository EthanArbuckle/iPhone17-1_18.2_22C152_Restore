@interface QRStreamInfo
- (id)initQRStreamInfo:(id)a3 subscribedStreams:(id)a4 generationCounter:(id)a5 maxConcurrentStreams:(id)a6;
@end

@implementation QRStreamInfo

- (id)initQRStreamInfo:(id)a3 subscribedStreams:(id)a4 generationCounter:(id)a5 maxConcurrentStreams:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)QRStreamInfo;
  v15 = [(QRStreamInfo *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_publishedStreams, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxConcurrentStreams, 0);
  objc_storeStrong((id *)&self->_generationCounter, 0);
  objc_storeStrong((id *)&self->_subscribedStreams, 0);

  objc_storeStrong((id *)&self->_publishedStreams, 0);
}

@end