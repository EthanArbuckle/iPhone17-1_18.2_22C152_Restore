@interface _ATXModePosterCandidate
- (ATXPosterDescriptor)descriptor;
- (BOOL)isPreferredForGallery;
- (NSString)fontName;
- (_ATXModePosterCandidate)initWithDescriptor:(id)a3 fontName:(id)a4 isPreferredForGallery:(BOOL)a5;
@end

@implementation _ATXModePosterCandidate

- (_ATXModePosterCandidate)initWithDescriptor:(id)a3 fontName:(id)a4 isPreferredForGallery:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_ATXModePosterCandidate;
  v11 = [(_ATXModePosterCandidate *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_descriptor, a3);
    uint64_t v13 = [v10 copy];
    fontName = v12->_fontName;
    v12->_fontName = (NSString *)v13;

    v12->_isPreferredForGallery = a5;
    v15 = v12;
  }

  return v12;
}

- (ATXPosterDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (BOOL)isPreferredForGallery
{
  return self->_isPreferredForGallery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end