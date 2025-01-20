@interface SKDownloadChangeset
+ (id)changesetWithDownloadID:(id)a3 state:(int64_t)a4;
- (NSError)error;
- (NSNumber)contentLength;
- (NSNumber)downloadID;
- (NSNumber)downloadState;
- (NSNumber)progress;
- (NSNumber)timeRemaining;
- (NSURL)contentURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContentLength:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setDownloadState:(id)a3;
- (void)setError:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTimeRemaining:(id)a3;
@end

@implementation SKDownloadChangeset

+ (id)changesetWithDownloadID:(id)a3 state:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(SKDownloadChangeset);
  [(SKDownloadChangeset *)v6 setDownloadID:v5];

  v7 = [NSNumber numberWithInteger:a4];
  [(SKDownloadChangeset *)v6 setDownloadState:v7];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSNumber *)self->_contentLength copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSURL *)self->_contentURL copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSNumber *)self->_downloadID copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSNumber *)self->_downloadState copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSError *)self->_error copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSNumber *)self->_progress copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  uint64_t v18 = [(NSNumber *)self->_timeRemaining copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSNumber)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(id)a3
{
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSNumber)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSNumber)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRemaining, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadState, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);

  objc_storeStrong((id *)&self->_contentLength, 0);
}

@end