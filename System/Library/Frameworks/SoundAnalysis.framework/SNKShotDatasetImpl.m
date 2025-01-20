@interface SNKShotDatasetImpl
@end

@implementation SNKShotDatasetImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);

  objc_storeStrong((id *)&self->_embeddings, 0);
}

@end