@interface _VNCalculateImageAestheticsScoresDependentRequests
- (VNClassifyImageAestheticsRequest)oldAestheticsRequest;
- (VNClassifyJunkImageRequest)junkRequest;
- (_VNCalculateImageAestheticsScoresDependentRequests)initWithRevision:(unint64_t)a3 error:(id *)a4;
- (id)requests;
@end

@implementation _VNCalculateImageAestheticsScoresDependentRequests

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junkRequest, 0);

  objc_storeStrong((id *)&self->_oldAestheticsRequest, 0);
}

- (VNClassifyJunkImageRequest)junkRequest
{
  return (VNClassifyJunkImageRequest *)objc_getProperty(self, a2, 16, 1);
}

- (VNClassifyImageAestheticsRequest)oldAestheticsRequest
{
  return (VNClassifyImageAestheticsRequest *)objc_getProperty(self, a2, 8, 1);
}

- (id)requests
{
  v5[2] = *MEMORY[0x1E4F143B8];
  junkRequest = self->_junkRequest;
  v5[0] = self->_oldAestheticsRequest;
  v5[1] = junkRequest;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (_VNCalculateImageAestheticsScoresDependentRequests)initWithRevision:(unint64_t)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_VNCalculateImageAestheticsScoresDependentRequests;
  v5 = [(_VNCalculateImageAestheticsScoresDependentRequests *)&v12 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = objc_alloc_init(VNClassifyImageAestheticsRequest);
  oldAestheticsRequest = v5->_oldAestheticsRequest;
  v5->_oldAestheticsRequest = v6;

  v8 = objc_alloc_init(VNClassifyJunkImageRequest);
  junkRequest = v5->_junkRequest;
  v5->_junkRequest = v8;

  if (a3 != 1) {
    goto LABEL_6;
  }
  if ([(VNRequest *)v5->_oldAestheticsRequest setRevision:3737841667 error:0]
    && [(VNRequest *)v5->_junkRequest setRevision:3737841669 error:0])
  {
LABEL_5:
    v10 = v5;
  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

@end