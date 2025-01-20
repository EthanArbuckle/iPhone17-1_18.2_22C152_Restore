@interface HSNowPlayingArtworkRequest
- (CGSize)maximumSize;
- (HSNowPlayingArtworkRequest)initWithInterfaceID:(unsigned int)a3 maximumSize:(CGSize)a4 playQueueIndex:(unsigned int)a5;
- (id)canonicalResponseForResponse:(id)a3;
- (unsigned)interfaceID;
- (unsigned)playQueueIndex;
@end

@implementation HSNowPlayingArtworkRequest

- (unsigned)playQueueIndex
{
  return self->_playQueueIndex;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[HSResponse responseWithResponse:a3];
  v4 = [v3 error];

  if (!v4)
  {
    v5 = [v3 MIMEType];
    [v3 setArtworkMIMEType:v5];

    v6 = [v3 responseData];
    [v3 setArtworkData:v6];
  }
  return v3;
}

- (HSNowPlayingArtworkRequest)initWithInterfaceID:(unsigned int)a3 maximumSize:(CGSize)a4 playQueueIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%u/%s", "ctrl-int", *(void *)&a3, "nowplayingartwork");
  v18.receiver = self;
  v18.super_class = (Class)HSNowPlayingArtworkRequest;
  v11 = [(HSRequest *)&v18 initWithAction:v10];

  if (v11)
  {
    HIDWORD(v12) = 1048576000;
    if (width > 0.00000011920929 || height > 0.00000011920929)
    {
      LODWORD(v12) = vcvtpd_s64_f64(width);
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v12);
      [(HSRequest *)v11 setValue:v13 forArgument:@"mw"];

      LODWORD(v14) = vcvtpd_s64_f64(height);
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v14);
      [(HSRequest *)v11 setValue:v15 forArgument:@"mh"];
    }
    if (v5)
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v5);
      [(HSRequest *)v11 setValue:v16 forArgument:@"index"];
    }
    v11->_interfaceID = a3;
    v11->_maximumSize.double width = width;
    v11->_maximumSize.double height = height;
    v11->_playQueueIndex = v5;
  }
  return v11;
}

@end