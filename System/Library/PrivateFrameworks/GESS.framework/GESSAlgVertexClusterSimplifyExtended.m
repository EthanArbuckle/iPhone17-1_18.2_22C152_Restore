@interface GESSAlgVertexClusterSimplifyExtended
- (BOOL)run:(id)a3;
- (id)returnClusterCenterColors;
- (id)returnClusterCenterNormals;
- (id)returnClusterCenterPositions;
- (void)setOptions:(id)a3;
@end

@implementation GESSAlgVertexClusterSimplifyExtended

- (void)setOptions:(id)a3
{
}

- (BOOL)run:(id)a3
{
  id v4 = a3;
  [(GESSAlgBase *)self setAlgStatus:1];
  if (([v4 valid] & 1) != 0 && objc_msgSend(v4, "meshType") == 1)
  {
    v16[1] = 0;
    [(GESSAlgVertexClusterSimplifyOptions *)self->_options voxelSize];
    v16[0] = v5;
    memset(v15, 0, sizeof(v15));
    char v6 = cv3d::cv::gess::alg::VertexClusterCenters([v4 meshImpl], v15, v16);
    if (v6)
    {
      Attribute2Bytes((uint64_t *)v15[0]);
      v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      clusterCenterPositions = self->_clusterCenterPositions;
      self->_clusterCenterPositions = v7;

      Attribute2Bytes((uint64_t *)(v15[0] + 24));
      v9 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      clusterCenterColors = self->_clusterCenterColors;
      self->_clusterCenterColors = v9;

      Attribute2Bytes((uint64_t *)(v15[0] + 48));
      v11 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      clusterCenterNormals = self->_clusterCenterNormals;
      self->_clusterCenterNormals = v11;

      uint64_t v13 = 3;
    }
    else
    {
      uint64_t v13 = 2;
    }
    [(GESSAlgBase *)self setAlgStatus:v13];
    v17 = (void **)v15;
    std::vector<std::vector<unsigned long long>>::__destroy_vector::operator()[abi:ne180100](&v17);
  }
  else
  {
    [(GESSAlgBase *)self setAlgStatus:2];
    char v6 = 0;
  }

  return v6;
}

- (id)returnClusterCenterPositions
{
  return self->_clusterCenterPositions;
}

- (id)returnClusterCenterColors
{
  return self->_clusterCenterColors;
}

- (id)returnClusterCenterNormals
{
  return self->_clusterCenterNormals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterCenterNormals, 0);
  objc_storeStrong((id *)&self->_clusterCenterColors, 0);
  objc_storeStrong((id *)&self->_clusterCenterPositions, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end