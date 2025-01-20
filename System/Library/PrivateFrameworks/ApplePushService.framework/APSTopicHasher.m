@interface APSTopicHasher
- (APSTopicHasher)initWithTopicSaltStore:(id)a3;
- (APSTopicSaltStore)topicSaltStore;
- (id)_identifierForTopic:(id)a3 user:(id)a4;
- (id)createTopicHashForTopic:(id)a3 user:(id)a4 shouldSalt:(BOOL)a5;
- (id)topicHashForTopic:(id)a3 user:(id)a4;
- (id)topicsToSaltsWithUser:(id)a3;
- (void)clearSaltForTopic:(id)a3 user:(id)a4;
- (void)setTopicSaltStore:(id)a3;
@end

@implementation APSTopicHasher

- (APSTopicHasher)initWithTopicSaltStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSTopicHasher;
  v6 = [(APSTopicHasher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_topicSaltStore, a3);
  }

  return v7;
}

- (void)clearSaltForTopic:(id)a3 user:(id)a4
{
  id v6 = a4;
  id v8 = [(APSTopicHasher *)self _identifierForTopic:a3 user:v6];
  v7 = [(APSTopicHasher *)self topicSaltStore];
  [v7 saveSalt:0 forIdentifier:v8 user:v6];
}

- (id)createTopicHashForTopic:(id)a3 user:(id)a4 shouldSalt:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    v10 = [(APSTopicHasher *)self _identifierForTopic:v8 user:v9];
    v11 = [(APSTopicHasher *)self topicSaltStore];
    v12 = [v11 loadSaltForIdentifier:v10 user:v9];

    if (v12)
    {
      id v20 = v12;
      sub_10007EB48(v8, &v20);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = v20;
    }
    else
    {
      id v19 = 0;
      v12 = sub_10007EB48(v8, &v19);
      id v14 = v19;
      v15 = 0;
      if (v14 && v12)
      {
        v16 = [(APSTopicHasher *)self topicSaltStore];
        unsigned int v17 = [v16 saveSalt:v14 forIdentifier:v10 user:v9];

        if (v17) {
          v15 = v12;
        }
        else {
          v15 = 0;
        }
      }
      id v13 = v15;
    }
  }
  else
  {
    sub_10007E9FC(v8);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)topicHashForTopic:(id)a3 user:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APSTopicHasher *)self _identifierForTopic:v7 user:v6];
  id v9 = [(APSTopicHasher *)self topicSaltStore];
  v10 = [v9 loadSaltForIdentifier:v8 user:v6];

  if (v10)
  {
    id v13 = v10;
    v11 = sub_10007EB48(v7, &v13);

    id v7 = v13;
  }
  else
  {
    v11 = sub_10007E9FC(v7);
  }

  return v11;
}

- (id)topicsToSaltsWithUser:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(APSTopicHasher *)self topicSaltStore];
  id v6 = [v5 loadIdentifiersToSaltsForUser:v4];

  return v6;
}

- (id)_identifierForTopic:(id)a3 user:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 storageName];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = [v6 storageName];
    id v10 = +[NSString stringWithFormat:@"%@,%@", v5, v9];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (APSTopicSaltStore)topicSaltStore
{
  return self->_topicSaltStore;
}

- (void)setTopicSaltStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end