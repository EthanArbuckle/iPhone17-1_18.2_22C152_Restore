@interface ARMeshGeometry
+ (BOOL)supportsSecureCoding;
- (ARGeometryElement)faces;
- (ARGeometrySource)classification;
- (ARGeometrySource)colors;
- (ARGeometrySource)normals;
- (ARGeometrySource)vertices;
- (ARMeshGeometry)initWithCoder:(id)a3;
- (ARMeshGeometry)initWithVertices:(id)a3 faces:(id)a4;
- (ARMeshGeometry)initWithVertices:(id)a3 normals:(id)a4 faces:(id)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClassification:(id)a3;
- (void)setColors:(id)a3;
- (void)setFaces:(id)a3;
- (void)setNormals:(id)a3;
- (void)setVertices:(id)a3;
@end

@implementation ARMeshGeometry

- (ARMeshGeometry)initWithVertices:(id)a3 normals:(id)a4 faces:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ARMeshGeometry;
  v12 = [(ARMeshGeometry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_vertices, a3);
    objc_storeStrong((id *)&v13->_normals, a4);
    objc_storeStrong((id *)&v13->_faces, a5);
  }

  return v13;
}

- (ARMeshGeometry)initWithVertices:(id)a3 faces:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARMeshGeometry;
  id v9 = [(ARMeshGeometry *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vertices, a3);
    objc_storeStrong((id *)&v10->_faces, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  vertices = self->_vertices;
  id v5 = a3;
  [v5 encodeObject:vertices forKey:@"vertices"];
  [v5 encodeObject:self->_normals forKey:@"normals"];
  [v5 encodeObject:self->_faces forKey:@"faces"];
  [v5 encodeObject:self->_classification forKey:@"classification"];
  [v5 encodeObject:self->_colors forKey:@"colors"];
}

- (ARMeshGeometry)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARMeshGeometry;
  id v5 = [(ARMeshGeometry *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vertices"];
    vertices = v5->_vertices;
    v5->_vertices = (ARGeometrySource *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"normals"];
    normals = v5->_normals;
    v5->_normals = (ARGeometrySource *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faces"];
    faces = v5->_faces;
    v5->_faces = (ARGeometryElement *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classification"];
    classification = v5->_classification;
    v5->_classification = (ARGeometrySource *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colors"];
    colors = v5->_colors;
    v5->_colors = (ARGeometrySource *)v14;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (ARMeshGeometry *)a3;
  if (v5 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      vertices = self->_vertices;
      uint64_t v8 = [(ARMeshGeometry *)v6 vertices];
      if (vertices != v8)
      {
        id v9 = self->_vertices;
        v3 = [(ARMeshGeometry *)v6 vertices];
        if (![(ARGeometrySource *)v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_32;
        }
      }
      normals = self->_normals;
      uint64_t v12 = [(ARMeshGeometry *)v6 normals];
      if (normals != v12)
      {
        v13 = self->_normals;
        uint64_t v14 = [(ARMeshGeometry *)v6 normals];
        if (![(ARGeometrySource *)v13 isEqual:v14])
        {
          char v10 = 0;
LABEL_30:

LABEL_31:
          if (vertices == v8)
          {
LABEL_33:

            goto LABEL_34;
          }
LABEL_32:

          goto LABEL_33;
        }
        v36 = v14;
      }
      faces = self->_faces;
      v16 = [(ARMeshGeometry *)v6 faces];
      v37 = faces;
      if (faces == v16)
      {
        v33 = vertices;
        v34 = normals;
      }
      else
      {
        objc_super v17 = self->_faces;
        v35 = [(ARMeshGeometry *)v6 faces];
        if (!-[ARGeometryElement isEqual:](v17, "isEqual:"))
        {
          char v10 = 0;
LABEL_28:

LABEL_29:
          uint64_t v14 = v36;
          if (normals == v12) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        v33 = vertices;
        v34 = normals;
      }
      classification = self->_classification;
      v19 = [(ARMeshGeometry *)v6 classification];
      if (classification == v19)
      {
        v32 = v3;
      }
      else
      {
        v20 = self->_classification;
        uint64_t v21 = [(ARMeshGeometry *)v6 classification];
        v22 = v20;
        v23 = (void *)v21;
        if (![(ARGeometrySource *)v22 isEqual:v21])
        {
          char v10 = 0;
          vertices = v33;
          goto LABEL_26;
        }
        v31 = v23;
        v32 = v3;
      }
      colors = self->_colors;
      uint64_t v25 = [(ARMeshGeometry *)v6 colors];
      if (colors == (ARGeometrySource *)v25)
      {

        char v10 = 1;
      }
      else
      {
        v26 = (void *)v25;
        v27 = self->_colors;
        v28 = [(ARMeshGeometry *)v6 colors];
        char v10 = [(ARGeometrySource *)v27 isEqual:v28];
      }
      BOOL v29 = classification == v19;
      v3 = v32;
      vertices = v33;
      v23 = v31;
      if (v29)
      {
LABEL_27:

        normals = v34;
        if (v37 == v16) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
LABEL_26:

      goto LABEL_27;
    }
    char v10 = 0;
  }
LABEL_34:

  return v10;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  id v7 = [(ARMeshGeometry *)self vertices];
  [v6 appendFormat:@" vertices=\"%@\"", v7];

  uint64_t v8 = [(ARMeshGeometry *)self normals];
  [v6 appendFormat:@" normals=\"%@\"", v8];

  id v9 = [(ARMeshGeometry *)self faces];
  [v6 appendFormat:@" faces=\"%@\"", v9];

  char v10 = [(ARMeshGeometry *)self classification];

  if (v10)
  {
    id v11 = [(ARMeshGeometry *)self classification];
    [v6 appendFormat:@" classification=\"%@\"", v11];
  }
  uint64_t v12 = [(ARMeshGeometry *)self colors];

  if (v12)
  {
    v13 = [(ARMeshGeometry *)self colors];
    [v6 appendFormat:@" colors=\"%@\"", v13];
  }
  [v6 appendString:@">"];
  return v6;
}

- (ARGeometrySource)vertices
{
  return self->_vertices;
}

- (void)setVertices:(id)a3
{
}

- (ARGeometrySource)normals
{
  return self->_normals;
}

- (void)setNormals:(id)a3
{
}

- (ARGeometryElement)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
}

- (ARGeometrySource)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
}

- (ARGeometrySource)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_normals, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
}

@end